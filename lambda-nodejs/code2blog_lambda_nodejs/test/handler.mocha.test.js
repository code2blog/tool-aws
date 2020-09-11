const config = require('config')
const chai = require('chai');
const chaiHttp = require('chai-http');
chai.use(chaiHttp);

const expect = chai.expect;

describe('Tests Hello World', function () {
    this.timeout(10000);

    it('verifies successful greeting', async () => {

        const result = await chai.request(config.get('handler.endpoint'))
            .get('/');
        console.log('  - - - console log of response from aws lambda : ' + JSON.stringify(result.body));
        expect(result.statusCode).to.equal(200);
        expect(result.body).to.be.an('object');
        expect(result.body.body).to.be.a('string');
        expect(result.body.body).to.be.eq("Hello, World!");
    });
});