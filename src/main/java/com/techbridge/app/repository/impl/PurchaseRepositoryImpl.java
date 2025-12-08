package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.enums.ApprovalStatus;
import com.techbridge.app.repository.PurchaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class PurchaseRepositoryImpl implements PurchaseRepository {

    @Autowired
    EntityManagerFactory factory;

//    @Override
//    public Optional<PurchaseEntity> findById(int id) {
//        return Optional.empty();
//    }

    @Override
    public PurchaseEntity findById(int id) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            return manager.createNamedQuery("findById", PurchaseEntity.class)
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }

    @Override
    public boolean update(PurchaseEntity entity) {
        EntityManager manager = null;
        try{
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.merge(entity);
            manager.getTransaction().commit();
            return true;
        }catch (Exception r){
            r.printStackTrace();
            return false;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public List<PurchaseEntity> findByStatus(String status) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();

            ApprovalStatus enumStatus = ApprovalStatus.valueOf(status.toUpperCase());

            Query query = manager.createNamedQuery("findByStatus", PurchaseEntity.class);
            query.setParameter("status", enumStatus);

            return query.getResultList();

        } catch (NoResultException e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            if (manager != null && manager.isOpen()) {
                manager.close();
            }
        }
//
//    @Override
//    public boolean save(PurchaseEntity entity) {
//        return false;
//    }
    }

}
