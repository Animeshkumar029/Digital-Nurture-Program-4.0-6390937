package com.example;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    Calculator calculator;

    @BeforeEach
    void setUp() {
        calculator = new Calculator(); // 🔧 Fixture setup
        System.out.println("Setup completed");
    }

    @AfterEach
    void tearDown() {
        System.out.println("Teardown after test");
    }

    @Test
    void testAddition() {
        // Arrange done in @BeforeEach
        // Act
        int result = calculator.add(2, 3);
        // Assert
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    @Test
    void testSubtraction() {
        int result = calculator.subtract(5, 2);
        assertEquals(3, result, "5 - 2 should equal 3");
    }
}

