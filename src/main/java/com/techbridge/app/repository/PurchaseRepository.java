package com.techbridge.app.repository;

import com.techbridge.app.entity.PurchaseEntity;

import java.util.List;
import java.util.Optional;

public interface PurchaseRepository {
    Optional<PurchaseEntity> findById(int id);

    List<PurchaseEntity> findByStatus(String pending);

    boolean save(PurchaseEntity entity);
}
