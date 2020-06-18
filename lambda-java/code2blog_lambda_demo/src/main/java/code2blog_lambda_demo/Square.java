package code2blog_lambda_demo;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.util.Map;

public class Square implements RequestHandler<Map<String, Object>, Integer> {

    @Override
    public Integer handleRequest(Map<String, Object> event, Context context) {
        LambdaLogger logger = context.getLogger();
        Map<String, Object> params = (Map<String, Object>) event.get("params");
        Map<String, Object> querystring = (Map<String, Object>) params.get("querystring");
        Integer input = Integer.valueOf(querystring.get("input").toString());
        logger.log(String.format("received integer [%d] as input", input));
        return input * input;
    }
}