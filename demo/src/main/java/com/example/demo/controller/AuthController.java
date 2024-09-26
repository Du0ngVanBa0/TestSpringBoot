package com.example.demo.controller;

import com.example.demo.dto.auth.AuthResponse;
import com.example.demo.dto.auth.AuthenticationRequest;
import com.example.demo.dto.auth.MessageResponse;
import com.example.demo.dto.auth.RegisterRequest;
import com.example.demo.model.User;
import com.example.demo.service.AuthService;
import com.example.demo.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    private AuthService authService;
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterRequest data) {
        Optional<User> userOptional = userService.findByEmail(data.email());
        if (userOptional.isPresent()){
            User currentUser = userOptional.get();
            if (currentUser.isEnabled()){
                return new ResponseEntity<>(new MessageResponse("Email has been registered!"), HttpStatus.BAD_REQUEST);
            }
        }
        AuthResponse res;
        try {
            res = authService.register(data);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse("OTP registered failed!"), HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(res, HttpStatus.CREATED);
    }

    @PostMapping("/authenticate")
    public ResponseEntity<?> authenticate(@RequestBody AuthenticationRequest data) {
        try {
            return new ResponseEntity<>(authService.authenticate(data), HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.BAD_REQUEST);
        }
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public Map<String, String> handleValidationExceptions(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((org.springframework.validation.FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        return errors;
    }
}
