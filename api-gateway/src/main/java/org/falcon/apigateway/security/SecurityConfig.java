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
            // 3. this adds a filter capable of processing and validating JWT tokens using a jwt decoder bean.
            .oauth2ResourceServer(oauth2 -> oauth2
                    // before creating the filter chain
                    // spring will send a request to Keycloak (Auth server) to fetch the public key. (this public key is used to verify the signature of incoming jwt tokens attached to requests, it checks if the token was signed by the auth server using its private key)
                    // and then automatically create a JwtDecoder bean at startup and inject it here. so that we can validate the signature of incoming requests.
                .jwt(withDefaults())
                    // after validating the token, spring security will store user details in a security context that will be used later to check user roles/authorities.
            );

        // Disable CSRF for stateless JWT-based authentication
        http.csrf(ServerHttpSecurity.CsrfSpec::disable);

        return http.build();
    }
}