const _ = require('lodash');
const path = require('path');
const debug = require('debug')('fpm-plugin-rbac-mysql');
const { Factory } = require('./Rbac.js');

module.exports = {
  bind: (fpm) => {

    const rbacFactory = Factory(fpm)
    const bizModule = {

      grant: async ( { role_id, group_id, code } ) => {
        const bit = code.toString(2)
        const permit = _.padStart(bit, 3, '0') + ( code > 0?'1': '0');
        const row = { 
          can_delete: parseInt(permit[0]), 
          can_update: parseInt(permit[1]),
          can_create: parseInt(permit[2]), 
          can_read: parseInt(permit[3]),
        };
        const NOW = _.now();
        // check exists
        try {
          const count = await fpm.M.countAsync({
            table: 'sys_securityrelationship',
            condition: `role_id = ${role_id} and group_id = ${group_id}`
          })
          if(count > 0){
            // exists 
            await fpm.M.updateAsync({
              condition: `role_id = ${role_id} and group_id = ${group_id}`,
              table: 'sys_securityrelationship',
              row: _.assign(row, {
                updateAt: NOW,
              })
            })
          }else{
            await fpm.M.createAsync({
              table: 'sys_securityrelationship',
              row: _.assign(row, {
                role_id, group_id, createAt: NOW, updateAt: NOW,
              })
            })
          }
          return 1;  
        } catch (error) {
          debug(error);
          fpm.logger.error(error)
          return Promise.reject({
            message: `Grant Error For ROLE_ID: ${role_id}, GROUP_ID: ${group_id}, CODE: ${code}`,
            error,
          })
        }
        
      },
      mock: async () => {
        try {
          await fpm.M.install(path.join(__dirname, '../mock'))  
          return 1;
        } catch (error) {
          fpm.logger.error(error);
          return Promise.reject({
            message: 'Install Plugin fpm-plugin-rbac-mysql Error! Cant run the mock/*.sql files successlly!'
          });
        }
      },
    }

    fpm.registerAction('BEFORE_SERVER_START', async () => {
      fpm.rbacFactory = rbacFactory
      bizModule.getInfo = async ({ role_id }) => {
        try{
          let loginInfo = {}
          const rbac = await rbacFactory.getRbac(role_id)
          loginInfo.rbac = rbac.getAcl()
          loginInfo.role = rbac.getRole()
          return loginInfo
        }catch(e){
          return Promise.reject({errno: -1, error: e})
        }
      }
      fpm.extendModule('rbac', bizModule);
      if(fpm.M){
        try {
          await fpm.M.install(path.join(__dirname, '../meta'))  
        } catch (error) {
          debug(error);
          fpm.logger.error(error);
        }
      }
    }, 10)

  }
}
