REM execute get call to view the configuration of an existing object
aws apigateway get-integration --rest-api-id %REST_API_ID% --resource-id %REST_RESOURCE_ID% --http-method GET

REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "type": "AWS",
    "httpMethod": "POST",
    "uri": "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:123...:function:code2blog_lambda_demo/invocations",
    "requestTemplates": {
    ... }, "passthroughBehavior": "WHEN_NO_TEMPLATES",
    "contentHandling": "CONVERT_TO_TEXT",
    "timeoutInMillis": 29000,
    "cacheNamespace": "my3hf0",
    "cacheKeyParameters": [],
    "integrationResponses": {
        "200": {
            "statusCode": "200",
            "responseParameters": {
                "method.response.header.Access-Control-Allow-Origin": "'https://cdpn.io'"
            }
        }
    }
}
:endComment

