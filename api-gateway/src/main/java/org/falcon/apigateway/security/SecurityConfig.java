package org.falcon.apigateway.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebFluxSecurity // Use this annotation for reactive applications
public class SecurityConfig {

    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {
        http
            // 1. Authorize all incoming exchanges
            .authorizeExchange(exchange -> exchange
                // Permit actuator health/info for Docker/K8s probes
                .pathMatchers("/actuator/health", "/actuator/health/**", "/actuator/info").permitAll()
                // 2. Rule: Any exchange must be authenticated
                .anyExchange().authenticated()
            )
            // 3. Configure as a reactive OAuth2 Resource Server
            .oauth2ResourceServer(oauth2 -> oauth2
                // 4. Enable JWT validation
                .jwt(withDefaults())
            );

        // Disable CSRF for stateless JWT-based authentication
        http.csrf(ServerHttpSecurity.CsrfSpec::disable);

        return http.build();
    }
}