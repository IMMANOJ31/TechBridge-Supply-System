package com.techbridge.app.service;

import com.techbridge.app.entity.PurchaseEntity;

import java.util.List;

public interface PurchaseService {

    List<PurchaseEntity> getPendingPurchases();

    void approval(int id);

    void reject(int id);

    void hold(int id);
}
