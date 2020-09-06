REM The following invoke example invokes the code2blog_lambda_from_cli function synchronously.

aws lambda invoke --function-name code2blog_lambda_nodejs --payload '{}' response.json
more response.json

REM output from invoke command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "StatusCode": 200,
    "ExecutedVersion": "$LATEST"
}

Output payload is stored in response.json file. It looks like this
"hello code2blog viewers"

:endComment
