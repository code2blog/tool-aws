
REM The following create-role command creates a role named Test-Role and attaches a trust policy to it:
aws iam create-role --role-name Test-Role --assume-role-policy-document file://01-Test-Role-TrustPolicy.json

REM output from get-role command looks something like this
set "beginComment=goto :endComment"
%beginComment%
{
    "Role": {
        "Path": "/",
        "RoleName": "Test-Role",
        "RoleId": "ARO...",
        "Arn": "arn:aws:iam::470...:role/Test-Role",
        "CreateDate": "2020-08-29T15:19:44+00:00",
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
        }
    }
}

:endComment