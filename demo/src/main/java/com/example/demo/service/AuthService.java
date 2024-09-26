package com.example.demo.service;

import com.example.demo.config.JwtService;
import com.example.demo.dto.auth.AuthResponse;
import com.example.demo.dto.auth.AuthenticationRequest;
import com.example.demo.dto.auth.MessageResponse;
import com.example.demo.dto.auth.RegisterRequest;
import com.example.demo.model.Role;
import com.example.demo.model.User;
import com.example.demo.utils.Util;
import jakarta.security.auth.message.AuthException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class AuthService {
    @Autowired
    private UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;

    public AuthService(PasswordEncoder passwordEncoder, JwtService jwtService, AuthenticationManager authenticationManager) {
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
        this.authenticationManager = authenticationManager;
    }

    public AuthResponse register(RegisterRequest data) {
        var user = User.builder()
                .name(data.name())
                .email(data.email())
                .password(passwordEncoder.encode(data.password()))
                .role(Role.USER)
                .build();
        userService.save(user);
        String jwtToken = jwtService.generateToken(user);
        return new AuthResponse(jwtToken);
    }

    public AuthResponse authenticate(AuthenticationRequest data) throws Exception {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            data.email(),
                            data.password()
                    )
            );
        } catch (AuthenticationException e) {
            throw new Exception("The account or password is incorrect!");
        }
        User user = userService.findByEmail(data.email()).orElseThrow(
                () -> new Exception("The account does not exist!")
        );
            String jwtToken = jwtService.generateToken(user);
            return new AuthResponse(jwtToken);
    }
}
