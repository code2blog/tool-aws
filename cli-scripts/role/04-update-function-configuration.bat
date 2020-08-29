REM The following update-function-configuration example modifies the timout to be 50 seconds

aws lambda update-function-configuration --function-name  code2blog_lambda_from_cli --timeout 50 --handler code2blog_lambda_demo.Hello::handleRequest

REM output from update-function-configuration command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "FunctionName": "code2blog_lambda_from_cli",
    "FunctionArn": "arn:aws:lambda:us-east-2:470...:function:code2blog_lambda_from_cli",
    "Runtime": "java8",
    "Role": "arn:aws:iam::470...:role/Test-Role",
    "Handler": "code2blog_lambda_demo.Hello::handleRequest",
    "CodeSize": 6886287,
    "Description": "",
    "Timeout": 50,
    "MemorySize": 128,
    "LastModified": "2020-08-29T16:13:07.850+0000",
    "CodeSha256": "7rJrWvrq7QEfJ9ZmksskFNknA8PdPkEo6rBrS5DsD1w=",
    "Version": "$LATEST",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "0b55b79f-fb8f-46d4-85bc-f3cfc69dbdd8",
    "State": "Active",
    "LastUpdateStatus": "Successful"
}


:endComment