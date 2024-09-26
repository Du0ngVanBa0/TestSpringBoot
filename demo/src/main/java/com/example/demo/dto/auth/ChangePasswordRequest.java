package com.example.demo.dto.auth;

import jakarta.validation.constraints.NotBlank;

public record ChangePasswordRequest(
        @NotBlank(message = "Ticket Id is required!")
        String ticketId,
        @NotBlank(message = "Password is required!")
        String password) {
}