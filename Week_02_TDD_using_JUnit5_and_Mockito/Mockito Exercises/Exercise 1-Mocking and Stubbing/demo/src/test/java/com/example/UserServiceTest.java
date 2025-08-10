package com.example;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class UserServiceTest {

    private UserRepository mockRepo;
    private UserService userService;

    @BeforeEach
    void setup() {
        // Arrange: Setup mock and service
        mockRepo = mock(UserRepository.class);
        userService = new UserService(mockRepo);
    }

    @Test
    void testGetUserName_whenUserExists() {
        // Arrange
        User mockUser = new User("1", "Alice");
        when(mockRepo.findUserById("1")).thenReturn(mockUser);

        // Act
        String name = userService.getUserName("1");

        // Assert
        assertEquals("Alice", name);
    }

    @Test
    void testGetUserName_whenUserDoesNotExist() {
        // Arrange
        when(mockRepo.findUserById("2")).thenReturn(null);

        // Act
        String name = userService.getUserName("2");

        // Assert
        assertEquals("Unknown User", name);
    }
}

