package com.cashplus.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

public class TestJWT {
    public static void main(String[] args) {
        String secretKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ"; // Example key

        String jwt = Jwts.builder()
                .setSubject("user123")
                .setIssuedAt(new Date())  // Set the issued date
                .signWith(SignatureAlgorithm.HS256, secretKey)  // HS256 algorithm with the secret key
                .compact();  // Generate the compact JWT token


        System.out.println("JWT Token: " + jwt);
    }
}
 