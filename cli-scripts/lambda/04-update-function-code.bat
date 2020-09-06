REM The following update-function-code example uploads a zip file which is equivalent of deploying a new lambda code

SET ZIP_FILE_PATH=C:\vishnu\app_group\repository\github_code2blog\tool-aws\lambda-nodejs\code2blog_lambda_nodejs.zip
aws lambda update-function-code --function-name  code2blog_lambda_nodejs --zip-file fileb://%ZIP_FILE_PATH%

REM output from update-function-configuration command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "FunctionName": "code2blog_lambda_nodejs",
    "FunctionArn": "arn:aws:lambda:us-east-2:234...:function:code2blog_lambda_nodejs",
    "Runtime": "nodejs12.x",
    "Role": "arn:aws:iam::234...:role/service-role/code2blog_lambda_nodejs-role-6i12qj3w",
    "Handler": "index.handler",
    "CodeSize": 237,
    "Description": "logs the entire event payload and responds with string message",
    "Timeout": 3,
    "MemorySize": 128,
    "LastModified": "2020-09-05T15:10:44.901+0000",
    "CodeSha256": "ndaAZ7y99MFMvgDu6gJhxrZT48ozaFdo24y44PqUlng=",
    "Version": "$LATEST",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "7304c201-74fb-48e0-8e07-d030e4db2dc2",
    "State": "Active",
    "LastUpdateStatus": "Successful"
}

:endComment