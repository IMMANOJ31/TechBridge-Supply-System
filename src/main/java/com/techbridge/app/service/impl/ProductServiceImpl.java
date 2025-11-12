package com.techbridge.app.service.impl;

import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.dto.PurchaseDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.repository.CustomerRepo;
import com.techbridge.app.repository.ProductRepo;
import com.techbridge.app.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import javax.swing.plaf.basic.BasicEditorPaneUI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductRepo productRepo;
    private final CustomerRepo customerRepo;

    public ProductServiceImpl(ProductRepo productRepo, CustomerRepo customerRepo){
        this.productRepo = productRepo;
        this.customerRepo = customerRepo;
    }

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

    @Override
    public PurchaseEntity savePurchaseDetail(PurchaseDto dto) {
        PurchaseEntity purchaseEntity = new PurchaseEntity();
        BeanUtils.copyProperties(dto,purchaseEntity);
        return productRepo.savePurchase(purchaseEntity);
    }

    @Override
    public List<PurchaseDto> fetchAllPurchaseList() {
        List<PurchaseEntity> purchaseEntities = productRepo.fetchPurchase();
        List<PurchaseDto> purchaseDtoList = new ArrayList<>();
        for (PurchaseEntity entity : purchaseEntities){
            PurchaseDto purchaseDto = new PurchaseDto();
            BeanUtils.copyProperties(entity,purchaseDto);
            purchaseDtoList.add(purchaseDto);
        }
        return purchaseDtoList;
    }


}
