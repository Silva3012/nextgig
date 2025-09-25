package za.co.nextgig.config;

import com.google.cloud.vision.v1.ImageAnnotatorClient;
import org.mockito.Mockito;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Configuration
@EnableAsync
public class AppConfig {
    /*@Bean
    public ImageAnnotatorClient imageAnnotatorClient() throws IOException {
        return ImageAnnotatorClient.create();
    }*/

    @Bean
    @Primary
    public ImageAnnotatorClient dummyImageAnnotatorClient() {
        return Mockito.mock(ImageAnnotatorClient.class);
    }
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();  // no Apache HttpClient, just Java's default
    }
}
