package code2blog_lambda_demo;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.util.Map;

public class User implements RequestHandler<Map<String, String>, String> {

    @Override
    public String handleRequest(Map<String, String> event, Context context) {
        String input = event.get("name");
        String output = String.format("hello [%s], welcome to code2blog", input);
        return output;
    }
}
