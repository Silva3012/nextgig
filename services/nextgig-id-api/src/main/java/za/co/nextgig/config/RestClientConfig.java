package za.co.nextgig.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestClient;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/

@Configuration
public class RestClientConfig {
//    @Bean
//    public RestClient restClient() {
//        HttpComponentsClientHttpRequestFactory factory =
//                new HttpComponentsClientHttpRequestFactory();
//
//        // Timeout configurations
//        factory.setConnectTimeout(5000);      // 5 seconds
//        factory.setConnectionRequestTimeout(5000); // 5 seconds
//        factory.setReadTimeout(30000);        // 30 seconds
//
//        return RestClient.builder()
//                .requestFactory(factory)
//                .defaultHeader("User-Agent",
//                        "DocumentVerificationService/1.0")
//                .defaultHeader("Accept", "application/json")
//                .build();
//    }
//
//    // Optional: Dedicated RestClient for external API calls
//    @Bean(name = "externalApiRestClient")
//    public RestClient externalApiRestClient() {
//        HttpComponentsClientHttpRequestFactory factory =
//                new HttpComponentsClientHttpRequestFactory();
//        factory.setConnectTimeout(10000);    // 10 seconds for external APIs
//        factory.setReadTimeout(60000);       // 60 seconds for external APIs
//
//        return RestClient.builder()
//                .requestFactory(factory)
//                .defaultHeader("User-Agent", "DocumentVerificationService/1.0")
//                .baseUrl("https://api.example.com") // Set base URL if needed
//                .build();
//    }
}
