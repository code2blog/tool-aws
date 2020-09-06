REM Call the put-method-response command to set up the 200 OK response of the GET /pets method, specifying the /pets resource by its ID value 

aws apigateway put-method-response --rest-api-id %REST_API_ID%  --resource-id %REST_RESOURCE_ID% --http-method GET        --status-code 200  --region us-east-2

	   
REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "statusCode": "200"
}
:endComment

