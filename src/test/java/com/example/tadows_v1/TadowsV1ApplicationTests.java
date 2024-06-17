package com.example.tadows_v1;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@SpringBootTest
class TadowsV1ApplicationTests {

    @Test
    void contextLoads() {
    }

    @Autowired
    private DataSource dataSource;

    @Test
    public void testDatabaseConnection() {
        try (Connection connection = dataSource.getConnection()) {
            if (connection != null) {
                System.out.println("Successfully connected to the database!");
            } else {
                throw new SQLException("Failed to get database connection.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database connection test failed", e);
        }
    }

}
