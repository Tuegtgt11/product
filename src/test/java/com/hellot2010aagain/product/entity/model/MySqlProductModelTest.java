package com.hellot2010aagain.product.entity.model;

import com.hellot2010aagain.product.entity.Product;
import com.hellot2010aagain.product.model.MySqlProductModel;
import com.hellot2010aagain.product.model.ProductModel;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MySqlProductModelTest {
    ProductModel model;

    @BeforeEach
    void setUp() {
        model = new MySqlProductModel();
    }

    @Test
    void findById() {
        Product product = model.findById("SP001");
        assertEquals("Hooded thermal anorak",product.getName());
    }

    @Test
    void update() {
        Product product = model.findById("SP002");
        product.setName("Update");
        model.update("SP002",product);
        Product product1 = model.findById("SP002");
        assertEquals("Update",product1.getName());
    }

    @Test
    void delete() {
        model.delete("SP002");
        Product product = model.findById("SP002");
        assertEquals(null,product);
    }
}