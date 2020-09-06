REM Call the create-resource command to append a child resource (pets) under the root resource 
aws apigateway create-resource --rest-api-id %REST_API_ID%  --region us-east-2  --parent-id %REST_PARENT_ID%     --path-part pets

REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "id": "abc..",
    "parentId": "def...",
    "pathPart": "pets",
    "path": "/pets"
}

:endComment