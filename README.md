## FPM-PLUGIN-RBAC-MYSQL
A Rbac Plugin For FPM With Mysql

### Install
```bash
yarn add fpm-plugin-rbac-mysql
```

### Useage

```javascript
//get rbac of a roleid
// fpm.rbac.getRbac(roleid:Number) => RBAC
const rbac = await fpm.rbacFactory.getRbac(obsInfo.role_id)
```

```javascript
//get acl from rbac instance
RBAC.getAcl()
RBAC.getRole()
```
