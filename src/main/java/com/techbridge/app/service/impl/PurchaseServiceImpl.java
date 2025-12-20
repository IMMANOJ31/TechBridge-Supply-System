package com.techbridge.app.service.impl;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.enums.ApprovalStatus;
import com.techbridge.app.repository.PurchaseRepository;
import com.techbridge.app.service.PurchaseService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class PurchaseServiceImpl implements PurchaseService {

    private PurchaseRepository repo;

    public PurchaseServiceImpl(PurchaseRepository repo){
        this.repo = repo;
    }

    @Transactional
    public PurchaseEntity approval(int id) {

        PurchaseEntity entity = repo.findById(id);

        if (entity == null) {
            throw new RuntimeException("Purchase not found with id: " + id);
        }
        entity.setStatus(ApprovalStatus.APPROVED);
        repo.update(entity);
        return entity;
    }


    @Transactional
    public PurchaseEntity reject(int id) {
        PurchaseEntity entity = repo.findById(id);
        if (entity == null) {
            throw new RuntimeException("Purchase not found with id: " + id);
        }
        entity.setStatus(ApprovalStatus.REJECTED);
        repo.update(entity);
        return entity;
    }

    @Transactional
    public PurchaseEntity hold(int id) {
        PurchaseEntity entity = repo.findById(id);
        if (entity == null) {
            throw new RuntimeException("Purchase not found with id: " + id);
        }
        entity.setStatus(ApprovalStatus.HOLD);
        repo.update(entity);
        return entity;
    }

    @Override
    public List<PurchaseEntity> findByStatus(String status) {
        return repo.findByStatus(status);
    }

    @Override
    public PurchaseEntity getByProductCode(String productCode) {
        return repo.fetchTheProductCode(productCode);
    }

}
