package code2blog_lambda_demo;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;
import com.amazonaws.services.sqs.model.Message;
import com.amazonaws.services.sqs.model.SendMessageRequest;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.List;
import java.util.Map;

public class SqsToSqs implements RequestHandler<Map<String, Object>, String> {

    Gson gson = new GsonBuilder().setPrettyPrinting().create();

    @Override
    public String handleRequest(Map<String, Object> event, Context context) {
        LambdaLogger logger = context.getLogger();

        String fileContents = gson.toJson(event);
        logger.log(fileContents);
        List records = (List) event.get("Records");
        String QUEUE_NAME = "LAMBDA-WILL-WRITE-TO-THIS-QUEUE";
        final AmazonSQS sqs = AmazonSQSClientBuilder.defaultClient();
        String queueUrl = sqs.getQueueUrl(QUEUE_NAME).getQueueUrl();

        Message message = gson.fromJson(gson.toJson(records.get(0)), Message.class);
        String body = String.format("i received a sqs message with payload=[%s]", message.getBody());
        logger.log(body);

        SendMessageRequest send_msg_request = new SendMessageRequest()
                .withQueueUrl(queueUrl)
                .withMessageBody(body);
        sqs.sendMessage(send_msg_request);

        return "sqs event received";
    }
}
