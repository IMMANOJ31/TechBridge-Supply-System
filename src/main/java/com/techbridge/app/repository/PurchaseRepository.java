package com.techbridge.app.repository;

import com.techbridge.app.entity.PurchaseEntity;

import java.util.List;
import java.util.Optional;

public interface PurchaseRepository {
//    Optional<PurchaseEntity> findById(int id);

    List<PurchaseEntity> findByStatus(String status);

    boolean save(PurchaseEntity entity);

    PurchaseEntity findById(int id);

    boolean update(PurchaseEntity entity);
}
