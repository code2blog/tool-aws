REM Call the put-method command to add the GET HTTP method on the /pets resource. This creates an API Method of GET /pets with open access, referencing the /pets resource by its ID value.

aws apigateway put-method --rest-api-id %REST_API_ID%       --resource-id %REST_RESOURCE_ID%       --http-method GET        --authorization-type "NONE"        --region us-east-2


REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "httpMethod": "GET",
    "authorizationType": "NONE",
    "apiKeyRequired": false
}


:endComment

