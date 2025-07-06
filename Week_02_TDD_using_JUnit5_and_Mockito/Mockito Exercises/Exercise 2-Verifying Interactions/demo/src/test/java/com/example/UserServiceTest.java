package com.example;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;

public class UserServiceTest {

    private UserRepository mockRepo;
    private UserService userService;

    @BeforeEach
    void setUp() {
        mockRepo = Mockito.mock(UserRepository.class);
        userService = new UserService(mockRepo);
    }

    @Test
    void testRegisterUser_VerifiesSaveCalled() {
        // Arrange
        String userName = "Animesh";

        // Act
        userService.registerUser(userName);

        // Assert (Verify interaction)
        verify(mockRepo, times(1)).save(any(User.class));
    }
}
