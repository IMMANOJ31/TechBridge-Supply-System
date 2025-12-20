package com.techbridge.app.service;

import com.techbridge.app.entity.PurchaseEntity;

import java.util.List;

public interface PurchaseService {

//    List<PurchaseEntity> getPendingPurchases(String status);

    PurchaseEntity approval(int id);

    PurchaseEntity reject(int id);

    PurchaseEntity hold(int id);

    List<PurchaseEntity> findByStatus(String status);


    PurchaseEntity getByProductCode(String productCode);
}
