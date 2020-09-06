REM Deploy the API to a stage stage, for example, by calling create-deployment:
REM i have previously created dev stage

aws apigateway create-deployment --rest-api-id %REST_API_ID%       --region us-east-2 --stage-name dev 


REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "id": "abc..",
    "createdDate": "2020-09-06T21:46:19+05:30"
}

:endComment
