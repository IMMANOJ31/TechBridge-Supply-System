package com.techbridge.app.service;

import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.entity.ProductEntity;

import java.util.List;

public interface ProductService {

    List<String> getAllProductGroups();

    ProductEntity saveProduct(ProductDto dto);
}
