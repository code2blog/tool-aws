package code2blog_lambda_demo;

import com.amazonaws.services.sqs.model.Message;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.junit.Test;

import java.nio.file.Files;
import java.nio.file.Paths;

public class LocalTest {

    Gson gson = new GsonBuilder().setPrettyPrinting().create();

    @Test
    public void should_create_sqs_message_from_json() throws Exception {
        String messageString = new String(Files.readAllBytes(Paths.get("C:\\vishnu\\app_group\\repository\\github_code2blog\\tool-aws\\lambda-java\\code2blog_lambda_demo\\src\\main\\resources\\sqs-message.json")));
        Message message = gson.fromJson(messageString, Message.class);
        System.out.println(message.getMessageId());
    }
}
