package com.techbridge.app.service.impl;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.enums.ApprovalStatus;
import com.techbridge.app.repository.PurchaseRepository;
import com.techbridge.app.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseRepository repo;

    public List<PurchaseEntity> getPendingPurchases() {
        return repo.findByStatus("PENDING");
    }

    @Transactional
    public void approval(int id) {
        Optional<PurchaseEntity> optional = repo.findById(id);
        if (optional.isPresent()) {
            PurchaseEntity entity = optional.get();
            entity.setStatus(ApprovalStatus.APPROVED);
            repo.save(entity);
        }
    }

    @Transactional
    public void reject(int id) {
        Optional<PurchaseEntity> optional = repo.findById(id);
        if (optional.isPresent()) {
            PurchaseEntity entity = optional.get();
            entity.setStatus(ApprovalStatus.REJECTED);
            repo.save(entity);
        }
    }

    @Transactional
    public void hold(int id) {
        Optional<PurchaseEntity> optional = repo.findById(id);
        if (optional.isPresent()) {
            PurchaseEntity entity = optional.get();
            entity.setStatus(ApprovalStatus.HOLD);
            repo.save(entity);
        }
    }
}
