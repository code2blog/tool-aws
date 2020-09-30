const axios = require('axios')
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

        response = {
            'statusCode': 200,
            'body': soapResponse.data
        };

    } catch (err) {
        console.log(err);
        return err;
    }

    return response
};

