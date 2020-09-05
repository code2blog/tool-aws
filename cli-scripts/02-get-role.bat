
REM The following get-role command gets information about the role name given below
SET ROLE_NAME=code2blog_lambda_java-role-28ahmxt1
aws iam get-role --role-name %ROLE_NAME%

REM output from get-role command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "Role": {
        "Path": "/service-role/",
        "RoleName": "code2blog_lambda_java-role-28ahmxt1",
        "RoleId": "ARO..",
        "Arn": "arn:aws:iam::470...:role/service-role/code2blog_lambda_java-role-28ahmxt1",
        "CreateDate": "2020-06-16T16:33:42+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "lambda.amazonaws.com"
                    },
                    "Action": "sts:AssumeRole"
                }
            ]
        },
        "MaxSessionDuration": 3600,
        "RoleLastUsed": {
            "LastUsedDate": "2020-06-19T14:53:37+00:00",
            "Region": "us-east-2"
        }
    }
}

:endComment