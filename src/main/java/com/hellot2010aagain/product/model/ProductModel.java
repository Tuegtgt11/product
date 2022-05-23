package com.hellot2010aagain.product.model;

import com.hellot2010aagain.product.entity.Product;

import java.util.List;

public interface ProductModel {
    List<Product> findAll();

    Product findById(String id);

    Product update(String id, Product updateProduct);

    boolean delete(String id);

    Product save(Product product);
}
