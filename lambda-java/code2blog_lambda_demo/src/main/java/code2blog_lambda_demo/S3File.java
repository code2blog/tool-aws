package code2blog_lambda_demo;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

import java.util.Map;

public class S3File implements RequestHandler<Map<String, Object>, Integer> {

    @Override
    public Integer handleRequest(Map<String, Object> event, Context context) {
        LambdaLogger logger = context.getLogger();
        Map<String, Object> params = (Map<String, Object>) event.get("params");
        Map<String, Object> querystring = (Map<String, Object>) params.get("querystring");
        Integer input = Integer.valueOf(querystring.get("input").toString());

        String fileContents = String.format("square of [%d] is [%d]", input, input*input);
        AmazonS3 s3Client = AmazonS3ClientBuilder.defaultClient();
        s3Client.putObject("code2blog-bucket", "code2blog-square.txt", fileContents);

        logger.log("writing to s3 bucket");
        return input * input;
    }
}