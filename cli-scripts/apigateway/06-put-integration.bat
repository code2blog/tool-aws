REM Call the put-integration command to set up an Integration with a specified HTTP endpoint for the GET /pets method. The /pets resource is identified by its resource Id 

aws apigateway put-integration --rest-api-id %REST_API_ID% --resource-id %REST_RESOURCE_ID% --http-method GET --type AWS   --integration-http-method GET  --region us-east-2  --uri "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:%USER_NUMBER_FOR_ARN%:function:code2blog_lambda_nodejs/invocations

   
REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "type": "AWS",
    "httpMethod": "GET",
    "uri": "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:123...:function:code2blog_lambda_nodejs/invocations",
    "passthroughBehavior": "WHEN_NO_MATCH",
    "timeoutInMillis": 29000,
    "cacheNamespace": "abc...",
    "cacheKeyParameters": []
}

:endComment

