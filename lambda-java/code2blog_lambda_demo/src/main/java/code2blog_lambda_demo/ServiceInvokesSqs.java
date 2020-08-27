package code2blog_lambda_demo;


import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;
import com.amazonaws.services.sqs.model.Message;
import com.amazonaws.services.sqs.model.MessageAttributeValue;
import com.amazonaws.services.sqs.model.ReceiveMessageResult;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.List;
import java.util.Optional;

public class ServiceInvokesSqs implements RequestHandler<Object, String> {

    Gson gson = new GsonBuilder().setPrettyPrinting().create();

    @Override
    public String handleRequest(Object event, Context context) {
        LambdaLogger logger = context.getLogger();
        String correlationIdToSearch = "code2blog_corrlationId_123";

        final AmazonSQS sqs = AmazonSQSClientBuilder.defaultClient();
        String QUEUE_NAME = "MY_FIRST_QUEUE.fifo";
        String queueUrl = sqs.getQueueUrl(QUEUE_NAME).getQueueUrl();
        ReceiveMessageResult receiveMessageResult = sqs.receiveMessage(queueUrl);
        logger.log("connected to queue");
        List<Message> messages = receiveMessageResult.getMessages();
        logger.log("message count : " + messages.size());
        Optional<Message> matchingMessage = messages.stream().filter(message -> {
            MessageAttributeValue value = message.getMessageAttributes().get("CorrelationId");
            if (value == null) return false;
            logger.log("iterating messages. Found correlation id : " + value);
            return value.getStringValue().equals(correlationIdToSearch);
        }).findFirst();

        if (!matchingMessage.isPresent()) {
            return "message with matching correlation id not found";
        }
        return matchingMessage.get().getBody();
    }
}
