package com.example.auth;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final JwtService jwtService;

    public AuthController(JwtService jwtService) {
        this.jwtService = jwtService;
    }

    @PostMapping("/login")
    public TokenResponse login(@RequestBody UserCredentials credentials) {
        // For demo purposes: Accept any username/password
        String token = jwtService.generateToken(credentials.getUsername());
        return new TokenResponse(token);
    }
}
