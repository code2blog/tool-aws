const axios = require('axios');
const xml2js = require('xml2js');
let response;

exports.lambdaHandler = async (event, context) => {
    try {
        const sSoapRequest = `<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ndf="https://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl">
        <soapenv:Header/>
        <soapenv:Body>
           <ndf:LatLonListZipCode soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
              <zipCodeList xsi:type="xsd:string">12345</zipCodeList>
           </ndf:LatLonListZipCode>
        </soapenv:Body>
     </soapenv:Envelope>`;
        //
        let sUrl = 'https://graphical.weather.gov/xml/SOAP_server/ndfdXMLserver.php';
        const soapResponse = await axios.post(sUrl, sSoapRequest, {
            headers: {
                'Content-Type': 'text/xml',
            }});
        
        let jsonRepresentationOfXml = await parseXml(soapResponse.data);
        let sInnerXml = jsonRepresentationOfXml['SOAP-ENV:Envelope']['SOAP-ENV:Body']['ns1:LatLonListZipCodeResponse'].listLatLonOut['_'];
        // console.log(sInnerXml);
        let jsInnerXml = await parseXml(sInnerXml);

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
