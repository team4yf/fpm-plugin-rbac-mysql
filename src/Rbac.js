const _ = require('lodash')

class RBAC{
    constructor(role, metadata){
        this.role = role
        this.metadata = metadata
    }
    getAcl(){
        return _.map(this.metadata.acl, ac => {
            let r = _.find(this.metadata.relationship, { group_id: ac.group_id})
            if(_.isEmpty(r)){
                ac.hasPermission = false
            }else{
                let {can_create, can_update, can_read, can_delete} = r
                ac = _.assign(ac, {can_create, can_update, can_read, can_delete, hasPermission: true})
            }
            return ac
        })
    }
    hasPermission(acl){
        return false
    }
    isAdmin(){
        return false
    }
    getRole(){
        return this.metadata.role
    }
    toJson(){
        return this.metadata
    }
}

const Factory = fpm => {
    const M = fpm.M
    return {
        getRbac: async role => {
            try{
                const metadata = {}
                let data = await M.getAsync({ table: "sys_securityrole", id: parseInt(role) })
                metadata.role = data

                data = await M.findAsync({ table: "sys_securityrelationship", condition: { role_id: role}})
                metadata.relationship = data

                data = await M.findAsync({ table: "sys_securityacl"})
                metadata.acl = data
                return new RBAC(role, metadata)
            }catch(e){
                console.log(e)
                return {}
            }
            
        }
    }
}

exports.Factory = Factory



