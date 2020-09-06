REM Call the get-resources command to retrieve the root resource identifier of the RestApi.
aws apigateway get-resources --rest-api-id %REST_API_ID% --region us-east-2


REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "items": [
        {
            "id": "abc...",
            "path": "/"
        }
    ]
}
:endComment