
REM The following create-function example creates a Lambda function named code2blog_lambda_from_cli.
REM USER_NUMBER_FOR_ARN=123456789012
SET JAR_FILE_PATH=C:/vishnu/app_group/repository/github_code2blog/tool-aws/lambda-java/code2blog_lambda_demo/target/code2blog_lambda_demo-1.0-SNAPSHOT-jar-with-dependencies.jar

aws lambda create-function --function-name code2blog_lambda_from_cli --runtime java8 --zip-file fileb://%JAR_FILE_PATH% --handler code2blog_lambda_demo.Hello::handleRequest --role arn:aws:iam::%USER_NUMBER_FOR_ARN%:role/Test-Role


REM output from create-function command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "FunctionName": "code2blog_lambda_from_cli",
    "FunctionArn": "arn:aws:lambda:us-east-2:470...:function:code2blog_lambda_from_cli",
    "Runtime": "java8",
    "Role": "arn:aws:iam::4701...:role/Test-Role",
    "Handler": "code2blog_lambda_demo.Hello::handleRequest",
    "CodeSize": 6886287,
    "Description": "",
    "Timeout": 3,
    "MemorySize": 128,
    "LastModified": "2020-08-29T16:07:19.152+0000",
    "CodeSha256": "7rJrWvrq7QEfJ9ZmksskFNknA8PdPkEo6rBrS5DsD1w=",
    "Version": "$LATEST",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "cd0528b9-351f-4753-a43c-180bed0be64e",
    "State": "Active",
    "LastUpdateStatus": "Successful"
}

:endComment