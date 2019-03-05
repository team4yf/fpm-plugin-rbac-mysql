const { init, Func } = require("fpmc-jssdk");
const assert = require('assert');
init({ appkey:'123123', masterKey:'123123', endpoint: 'http://localhost:9999/api' });


describe('Function', function(){
  beforeEach(done => {
    done()
  })
  

  afterEach(done => {
    done()
  })

  it('Function A', function(done){
    var func = new Func('rbac.getInfo');
    func.invoke({ role_id: 3})
      .then(function(data){
        console.log(data)
        done();
      }).catch(function(err){
        done(err);
      })
  })

  it('Function A', function(done){
    var func = new Func('rbac.grant');
    func.invoke({role_id: 3, group_id : 3, code: 7 })
      .then(function(data){
        console.log(data)
        done();
      }).catch(function(err){
        done(err);
      })
  })

  it('Function A', function(done){
    var func = new Func('rbac.grant');
    func.invoke({role_id: 3, group_id : 3, code: 6 })
      .then(function(data){
        console.log(data)
        done();
      }).catch(function(err){
        done(err);
      })
  })

  it('Function A', function(done){
    var func = new Func('rbac.grant');
    func.invoke({role_id: 3, group_id : 3, code: 5 })
      .then(function(data){
        console.log(data)
        done();
      }).catch(function(err){
        done(err);
      })
  })

  it('Function A', function(done){
    var func = new Func('rbac.grant');
    func.invoke({role_id: 3, group_id : 3, code: 4 })
      .then(function(data){
        console.log(data)
        done();
      }).catch(function(err){
        done(err);
      })
  })

  it('Function A', function(done){
    var func = new Func('rbac.grant');
    func.invoke({role_id: 3, group_id : 3, code: 0 })
      .then(function(data){
        console.log(data)
        done();
      }).catch(function(err){
        done(err);
      })
  })
})
