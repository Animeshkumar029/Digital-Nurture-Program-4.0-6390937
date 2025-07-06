package com.example.springcore;

public class UserService {
    private final GreetingService greetingService;

    public UserService(GreetingService greetingService) {
        this.greetingService = greetingService;
    }

    public void greetUser() {
        System.out.println(greetingService.getGreeting());
    }
}
