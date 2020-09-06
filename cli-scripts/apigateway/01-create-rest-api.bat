REM Call the create-rest-api command to set up the RestApi in a specific region (us-east-2).
aws apigateway create-rest-api --name "Simple PetStore (AWS CLI)" --region us-east-2

REM output from command looks something like this
set "beginComment=goto :endComment"
%beginComment%
An error occurred (AccessDeniedException) when calling the CreateRestApi operation: User: arn:aws:iam::123...:user/cli_user is not authorized to perform: apigateway:POST on resource: arn:aws:apigateway:us-east-2::/restapis
REM if you face AccessDeniedException, then login to IAM interface and grant the necessary access

{
    "id": "abc...",
    "name": "Simple PetStore (AWS CLI)",
    "createdDate": "2020-09-06T20:37:56+05:30",
    "apiKeySource": "HEADER",
    "endpointConfiguration": {
        "types": [
            "EDGE"
        ]
    }
}

:endComment