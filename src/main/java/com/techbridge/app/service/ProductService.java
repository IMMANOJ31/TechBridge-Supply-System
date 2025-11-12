package com.techbridge.app.service;

import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.dto.PurchaseDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.entity.PurchaseEntity;

import java.util.List;

public interface ProductService {

    List<String> getAllProductGroups();

    ProductEntity saveProduct(ProductDto dto);

    PurchaseEntity savePurchaseDetail(PurchaseDto dto);

    List<PurchaseDto> fetchAllPurchaseList();
}
