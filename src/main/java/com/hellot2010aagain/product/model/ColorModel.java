package com.hellot2010aagain.product.model;

import com.hellot2010aagain.product.entity.Color;

import java.util.List;

public interface ColorModel {
    Color save(Color color);

    List<Color> findAll();

    Color findById(int id);

    Color update(int id,Color color);

    boolean delete(int id);
}
