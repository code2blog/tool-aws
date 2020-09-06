REM To grant invocation permission to an existing API, use the add-permission command.

 aws lambda add-permission --function-name code2blog_lambda_nodejs --statement-id apigateway-get --action lambda:InvokeFunction --principal apigateway.amazonaws.com --source-arn "arn:aws:execute-api:us-east-2:%USER_NUMBER_FOR_ARN%:%REST_API_ID%/dev/GET/"


   
REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "Statement": "{\"Sid\":\"apigateway-get\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apigateway.amazonaws.com\"},\"Action\":\"lambda:InvokeFunction\",\"Resource\":\"arn:aws
:123...:function:code2blog_lambda_nodejs\",\"Condition\":{\"ArnLike\":{\"AWS:SourceArn\":\"arn:aws:execute-api:us-east-2::/dev/GET/\"}}}"
}

:endComment



