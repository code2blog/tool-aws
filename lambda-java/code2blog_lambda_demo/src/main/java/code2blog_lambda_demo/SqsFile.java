package code2blog_lambda_demo;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.Map;

public class SqsFile implements RequestHandler<Map<String, Object>, String> {

    Gson gson = new GsonBuilder().setPrettyPrinting().create();

    @Override
    public String handleRequest(Map<String, Object> event, Context context) {
        LambdaLogger logger = context.getLogger();

        String fileContents = gson.toJson(event);
        logger.log(fileContents);

        AmazonS3 s3Client = AmazonS3ClientBuilder.defaultClient();
        s3Client.putObject("code2blog-bucket", "code2blog-sqs-demo.txt", fileContents);

        logger.log("writing to s3 bucket");
        return "sqs event received";
    }
}