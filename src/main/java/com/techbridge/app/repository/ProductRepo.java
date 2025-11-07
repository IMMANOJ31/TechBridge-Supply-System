package com.techbridge.app.repository;

import com.techbridge.app.entity.ProductEntity;

import java.util.List;

public interface ProductRepo {
    List<String> fetchProducts();

    ProductEntity save(ProductEntity entity);
}
