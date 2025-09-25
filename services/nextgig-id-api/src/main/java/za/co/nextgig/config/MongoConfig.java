package za.co.nextgig.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/

@Slf4j
@Configuration
public class MongoConfig {
    @Bean
    public CommandLineRunner checkMongoConnection(MongoTemplate mongoTemplate) {
        return args -> {
            try {
                mongoTemplate.executeCommand("{ ping: 1 }");
                log.info("MongoDB connection established successfully");
            } catch (Exception e) {
                log.error("MongoDB connection failed: {}", e.getMessage());
                log.info("Please ensure MongoDB is running on localhost:27017");
                log.info("You can start MongoDB with: docker run -d -p 27017:27017 --name mongodb mongo:latest");
            }
        };
    }
}
