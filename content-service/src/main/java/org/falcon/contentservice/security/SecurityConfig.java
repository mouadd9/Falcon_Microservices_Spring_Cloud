package org.falcon.contentservice.security;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            // 1. Authorize all incoming HTTP requests.
            .authorizeHttpRequests(authorize -> authorize
                // 2. Rule: Any request to any endpoint must be authenticated.
                .anyRequest().authenticated()
            )
            // 3. Configure the service as an OAuth2 Resource Server.
            .oauth2ResourceServer(oauth2 -> oauth2
                // 4. Enable JWT (JSON Web Token) validation.
                .jwt(withDefaults())
            );

        return http.build();
    }
}