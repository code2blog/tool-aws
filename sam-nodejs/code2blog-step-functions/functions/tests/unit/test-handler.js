'use strict';

const app = require('../../validate-property.js');
const chai = require('chai');
const expect = chai.expect;
var event, context;
event = {
        "ownerName": "Marcia",
        "ownerSSN": "12345567",
        "ownerPhone": "358440404040",
        "country": "Finland",
        "city": "Helsinki",
        "address": "Katu 1234",
        "propertyName": "La casita"
  };
describe('Tests index', function () {
    it('verifies successful response', async () => {
        const result = await app.lambdaHandler(event, context)

        expect(result).to.equal(true);
    });
});
