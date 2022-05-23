package com.hellot2010aagain.product.model;

import com.hellot2010aagain.product.entity.Category;

import java.util.List;

public interface CategoryModel {
    Category save(Category category);

    List<Category> findAll();

    Category findById(int id);

    Category update(int id,Category category);

    boolean delete(int id);
}
