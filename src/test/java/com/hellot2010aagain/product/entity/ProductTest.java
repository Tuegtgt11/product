package com.hellot2010aagain.product.entity;

import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;

class ProductTest {
    @Test
    public void testCreateProduct() {
        Product product = new Product();
        product.setId("1");
        product.setFullName("Robert Vu");
        product.setPrice("1000");
        product.setThumbnail("lorem .........");
        product.setCreatedAt(LocalDateTime.now());
        product.setCreatedAt(LocalDateTime.now());
        product.setStatus(1);
        System.out.printf(product.toString());
    }

}