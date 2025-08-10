package com.example;

public class UserService {
    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void registerUser(String name) {
        User user = new User(name);
        userRepository.save(user);
    }
}

