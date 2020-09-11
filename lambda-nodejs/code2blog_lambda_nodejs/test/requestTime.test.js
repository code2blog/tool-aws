
const assert = require('assert');
const requestTime = require('../requestTime');

describe('requestTime middleware', function () {
  it('should add a timestamp `requestTime` prop to `req`', function () {
    // requestTime() expects an object, any arg,
    // and finally a callback
    const req = {};
    requestTime(req, null, () => {});
    // a timestamp is a number
    assert.ok(req.requestTime > 0);
  });
});