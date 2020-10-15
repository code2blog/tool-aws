var soap = require('soap');
const xml2js = require('xml2js');
let response;

exports.lambdaHandler = async (event, context) => {
    try {
        let sUrl = 'https://raw.githubusercontent.com/nurullahsahin44/https-github.com-nurullahsahin44-anketuygula/b9bd6164e3ac13aafd8610d0e4fd52f6a18d6ff5/anketUygula/anketUygula/Service%20References/WebService/WebService1.wsdl';
        var args = { input: '12345' };
        let promise = new Promise(function (resolve, reject) {
            soap.createClient(sUrl, function (err, client) {
                // client object is created by using wsdl file by soap nodejs module
                //Client.describe() - description of services, ports and methods as a JavaScript object
                console.log(client.describe());
                console.log(JSON.stringify(client.describe() , null, 2) );
            });
        });
        let jsSoapResponse = await promise;

        response = {
            'statusCode': 200,
            'body': ''
        };
    } catch (err) {
        console.log(err);
        return err;
    }

    return response
};


async function parseXml(xmlString) {
    const promise = await new Promise((resolve, reject) => {
        const parser = new xml2js.Parser({ explicitArray: false });

        parser.parseString(xmlString, (error, result) => {
            if (error) reject(error);
            else resolve(result);
        });
    });
    return promise;
};
