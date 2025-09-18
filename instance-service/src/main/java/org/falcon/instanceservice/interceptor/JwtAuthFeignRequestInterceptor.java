package org.falcon.instanceservice.interceptor;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Component;

@Component
public class JwtAuthFeignRequestInterceptor implements RequestInterceptor {

    private static final String AUTHORIZATION_HEADER = "Authorization";
    private static final String BEARER_TOKEN_TYPE = "Bearer ";

    @Override
    public void apply(RequestTemplate template) {
        final var authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication instanceof JwtAuthenticationToken) {
            final var jwt = ((JwtAuthenticationToken) authentication).getToken();
            template.header(AUTHORIZATION_HEADER, BEARER_TOKEN_TYPE + jwt.getTokenValue());
        }
    }
}