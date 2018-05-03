import _ from 'lodash'
import { Factory } from './Rbac.js'
export default {
  bind: (fpm) => {
    const rbacFactory = Factory(fpm)
    // Run When Server Init
    fpm.registerAction('INIT', () => {
      const c = fpm.getConfig()
      console.log('Run Init Actions', c)
    })

    fpm.registerAction('BEFORE_SERVER_START', () => {
      fpm.rbacFactory = rbacFactory
      console.log('Run BEFORE_SERVER_START Actions')
    })

  }
}
