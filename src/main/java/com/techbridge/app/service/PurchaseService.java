package com.techbridge.app.service;

import com.techbridge.app.entity.PurchaseEntity;

import java.util.List;

public interface PurchaseService {

//    List<PurchaseEntity> getPendingPurchases(String status);

    PurchaseEntity approval(int id);

    void reject(int id);

    void hold(int id);

    List<PurchaseEntity> findByStatus(String status);
}
