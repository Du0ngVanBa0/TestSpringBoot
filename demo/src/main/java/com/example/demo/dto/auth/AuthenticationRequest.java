package com.example.demo.dto.auth;

public record AuthenticationRequest(
        String email,
        String password
) {
}
