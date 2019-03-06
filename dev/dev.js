'use strict';
const { Fpm } = require('yf-fpm-server');
const plugin = require('../src');
let app = new Fpm()
plugin.bind(app)

let biz = app.createBiz('0.0.1');

biz.addSubModules('test',{
	foo: async args => {
		try{
			let loginInfo = {}
			const rbac = await app.rbacFactory.getRbac(3)
			loginInfo.rbac = rbac.getAcl()
			loginInfo.role = rbac.getRole()
			return Promise.resolve(loginInfo)
		}catch(e){
			console.log(e)
			return Promise.reject({errno: -1, error: e})
		}
		
	}
})
app.addBizModules(biz);

//
// this plugin should run when INIT , but we cant run it in Dev Mode, so We should Run It Manually
app.runAction('INIT', app)

app.run()
	.then( () => {
		app.execute('rbac.mock')
			.catch(console.error)
	})
