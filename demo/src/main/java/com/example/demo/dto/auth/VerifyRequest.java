package com.example.demo.dto.auth;

import jakarta.validation.constraints.NotBlank;

public record VerifyRequest(
        @NotBlank(message = "Ticket Id is required!")
        String ticketId,
        @NotBlank(message = "OTP is required!")
        String otp) {
}
