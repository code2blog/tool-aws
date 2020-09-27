const axios = require('axios')
// const url = 'http://checkip.amazonaws.com/';
let response;

exports.lambdaHandler = async (event, context) => {
    try {
        var jsonObject = {
            menu: {}
        };

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

