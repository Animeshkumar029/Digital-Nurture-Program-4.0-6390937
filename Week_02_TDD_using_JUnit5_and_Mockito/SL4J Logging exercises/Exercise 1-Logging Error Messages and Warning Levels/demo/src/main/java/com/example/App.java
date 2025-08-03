package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App {
    private static final Logger logger = LoggerFactory.getLogger(App.class);

    public static void main(String[] args) {
        logger.info("Starting application...");

        try {
            int result = divide(10, 0);
            logger.info("Result: {}", result);
        } catch (ArithmeticException e) {
            logger.error("An error occurred: Division by zero!", e);
        }

        logger.warn("This is a warning message.");
        logger.info("Application finished.");
    }

    public static int divide(int a, int b) {
        return a / b;
    }
}

