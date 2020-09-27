const axios = require('axios')
// const url = 'http://checkip.amazonaws.com/';
let response;

exports.lambdaHandler = async (event, context) => {
    try {
        var jsonObject = {
            menu: {
                id: 123,
                dateField: new Date()           
             }
        };
        jsonObject.menu.popup = {
            menuitem: []
        }
        var referenceToPopup = jsonObject.menu.popup;
        var i = 0;
        referenceToPopup.menuitem[i++] = {"value": "New", "onclick": "CreateNewDoc()"};
        referenceToPopup.menuitem[i++] = {"value": "Open", "onclick": "OpenDoc()"};
        referenceToPopup.menuitem[i++] = {"value": "Close", "onclick": "CloseDoc()"};
        
        response = {
            'statusCode': 200,
            'body': JSON.stringify(jsonObject)
        };
    } catch (err) {
        console.log(err);
        return err;
    }

    return response
};

