package com.techbridge.app.service.impl;

import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.repository.ProductRepo;
import com.techbridge.app.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import javax.swing.plaf.basic.BasicEditorPaneUI;
import java.util.Collections;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductRepo productRepo;

    public ProductServiceImpl(ProductRepo productRepo){
        this.productRepo = productRepo;
    }

//    public void saveProduct(ProductDto dto){
//        ProductEntity entity = new ProductEntity();
//        BeanUtils.copyProperties(dto,entity);
//        productRepo.save(entity);
//    }

    @Override
    public List<String> getAllProductGroups() {
        return productRepo.fetchProducts();
    }

    @Override
    public ProductEntity saveProduct(ProductDto dto) {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(dto,productEntity);
        return productRepo.save(productEntity);
    }
}
