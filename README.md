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
	nj3 demo unit testing frameworks such as mocha, yarn, jest
	nj4 demo the use of mocha framework for testing aws lambdas
	
codepen
	ir1 write js code that invokes rest api of aws

cli-scripts
	iam/01 create a role, any role 
	iam/02 get details of any one role from my account 

	lambda/01 create lambda function
	lambda/02 update lambda function
	lambda/03 invoke lamada fucntion
	lambda/04 upload a zip file for nodejs lambda

	apigateway/01-10 create rest api which invokes nodejs lambda

sam-nodejs/code2blog_quick_start
	sam-1 create lambda and rest api using serverless application model 

sam-nodejs/code2blog-mock-multiple-ws
	mmw-1 create api gateway object that can return multiple responses json and xml based on http query parameters
	mmw-2 demo the logging features of aws lambda. Focus on uuid that binds related events
	
sam-nodejs/code2blog-middleware-api
	ma-1 create a lambda function that takes its configuration from s3 file, and invokes another api 
	ma-2 create a json object with different data types
	ma-3 parse xml file and navigate through its various fields
	ma-4 invoke a soap operation from nodejs
	ma-5 invoke soap service using proper soap client that understands wsdl
	ma-6 invoke soap service with lots of inner xml fields 

sam-nodejs/code2blog-step-functions
	sf-1 create step function and invoke nodejs lambda
	
</pre>
