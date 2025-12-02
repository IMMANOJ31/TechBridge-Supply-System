package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.repository.PurchaseRepository;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Repository
public class PurchaseRepositoryImpl implements PurchaseRepository {
    @Override
    public Optional<PurchaseEntity> findById(int id) {
        return Optional.empty();
    }

    @Override
    public List<PurchaseEntity> findByStatus(String pending) {
        return Collections.emptyList();
    }

    @Override
    public boolean save(PurchaseEntity entity) {
        return false;
    }
}
