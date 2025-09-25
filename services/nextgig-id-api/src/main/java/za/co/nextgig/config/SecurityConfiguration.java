package za.co.nextgig.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Configuration
public class SecurityConfiguration {

    private static final String[] WHITE_LIST_URL = {"/v2/api-docs",
            "/actuator/health","/actuator/metrics","/actuator/info",
            "/v3/api-docs", "/v3/api-docs/**",
            "/swagger-resources", "/swagger-resources/**",
            "/configuration/ui", "/configuration/security",
            "/swagger-ui/**", "/swagger-ui.html"};

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        return http.csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(auth-> auth.requestMatchers(WHITE_LIST_URL).permitAll())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)).build();
    }
}
