var soap = require('soap');
const xml2js = require('xml2js');
let response;

exports.lambdaHandler = async (event, context) => {
    try {
        let sUrl = 'https://graphical.weather.gov/xml/SOAP_server/ndfdXMLserver.php?wsdl';
        var args = { zipCodeList: '12345' };
        let promise = new Promise(function (resolve, reject) {
            soap.createClient(sUrl, function (err, client) {
                // client object is created by using wsdl file by soap nodejs module
                //Client.describe() - description of services, ports and methods as a JavaScript object
                console.log(client.describe());
                console.log(client.describe().ndfdXML.ndfdXMLPort.LatLonListZipCode);
                client.LatLonListZipCode(args, function (err, result) {
                    resolve(result);
                });
            });
        });
        let jsSoapResponse = await promise;
        let jsInnerXml = await parseXml(jsSoapResponse.listLatLonOut['$value']);

        response = {
            'statusCode': 200,
            'body': jsInnerXml.dwml.latLonList
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
