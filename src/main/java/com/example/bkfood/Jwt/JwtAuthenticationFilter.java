package com.example.bkfood.Jwt;

import com.example.bkfood.Models.UserDetail;
import com.example.bkfood.Services.UserService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JwtAuthenticationFilter extends OncePerRequestFilter {
    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    private UserService userService;

    private String getTokenFromRequest(HttpServletRequest request){
        String bearToken = request.getHeader("Authorization");
        System.out.println("get token from request");

        if (StringUtils.hasText(bearToken) && bearToken.startsWith("Bearer ")){
            System.out.println("return token");
            return bearToken.substring(7);
        }
        return null;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            System.out.println("do filter Internal");
            String token = getTokenFromRequest(request);

            if (StringUtils.hasText(token) && jwtTokenProvider.validateToken(token)){
                String username = jwtTokenProvider.getUserFromToken(token);
                System.out.println("token valid");

                UserDetail user = userService.loadUserByUsername(username);
                System.out.println(user.getUsername());
                if (user != null) {
                    System.out.println("have user");
                    UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
                    authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                }
            }
        } catch (Exception err){
            System.out.println("authenticated failed");
        }

        filterChain.doFilter(request, response);
    }


}

