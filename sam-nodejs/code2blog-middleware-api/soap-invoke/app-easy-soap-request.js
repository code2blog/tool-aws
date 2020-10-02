const soapRequest = require('easy-soap-request');
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
        const requestHeaders = {
            'Content-Type': 'text/xml;charset=UTF-8',
            'soapAction': 'https://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl#LatLonListZipCode',
        };

        const {response: soapResponse} = await soapRequest({ url: sUrl, headers: requestHeaders, xml: sSoapRequest }); // Optional timeout parameter(milliseconds)

        response = {
            'statusCode': 200,
            'body': soapResponse.body
        };

    } catch (err) {
        console.log(err);
        return err;
    }

    return response
};
