# tool-aws
I will be using this repository to store aws code samples that I blog about in this site https://code2blog.wordpress.com/

<pre>
Here are some of the projects in this repository

API/code2blog_demo_rest
	dr1 expose a rest endpoint that replies with json message
	dr2.1 authenticate rest endpoint using api key
	dr2.2 create custom http response header
	dr3 invoke lambda and use cors headers
	dr4 pass http headers to lambda
	dr5 validate input using api gateway and use body mapping template to transform input and output
	
standards
	s1 define file naming standards
	
lambda-java/code2blog_lambda_demo
	ld1 send some string response from lambda
	ld2 write file to s3 bucket
	ld3 read sqs event and write to s3 
	ld4 read from sqs and write to sqs
	ld5 read sqs event and extract message payload using sqs model classes
	ld6 execute sqs read call similiar to mq get node
	
lambda-nodejs/code2blog_lambda_nodejs
	nj1 create a nodejs lambda that replies with a hardcoded string
	nj2 create response fit for apigateway - {"statusCode":200,"headers":{"Content-Type":"*/*"},"body":"Hello, World!"}
	
codepen
	ir1 write js code that invokes rest api of aws

cli-scripts
	iam/01 create a role, any role 
	iam/02 get details of any one role from my account 

	lambda/01 create lambda function
	lambda/02 update lambda function
	lambda/03 invoke lamada fucntion
	lambda/04 upload a zip file for nodejs lambda

	apigateway/01 create rest api
	apigateway/02 get root resource identifier of rest api
	
</pre>
