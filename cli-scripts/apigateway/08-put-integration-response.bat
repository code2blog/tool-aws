REM Call the put-integration-response command to create an IntegrationResponse of the GET /pets method

aws apigateway put-integration-response --rest-api-id %REST_API_ID%   --resource-id %REST_RESOURCE_ID% --http-method GET      --status-code 200 --selection-pattern ""   --region us-east-2

REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "statusCode": "200",
    "selectionPattern": ""
}

:endComment

