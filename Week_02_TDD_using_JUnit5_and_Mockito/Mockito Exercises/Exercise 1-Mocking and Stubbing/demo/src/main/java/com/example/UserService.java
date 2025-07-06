package com.example;

public class UserService {

    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public String getUserName(String id) {
        User user = repository.findUserById(id);
        return user != null ? user.getName() : "Unknown User";
    }
}

