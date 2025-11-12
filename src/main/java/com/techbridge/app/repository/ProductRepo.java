package com.techbridge.app.repository;

import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.enums.ApprovalStatus;

import java.util.List;

public interface ProductRepo {
    List<String> fetchProducts();

    ProductEntity save(ProductEntity entity);

    PurchaseEntity savePurchase(PurchaseEntity purchaseEntity);

    List<PurchaseEntity> fetchPurchase();

    List<PurchaseEntity> findByStatus(ApprovalStatus approvalStatus);
}
