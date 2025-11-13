package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.enums.ApprovalStatus;
import com.techbridge.app.repository.ProductRepo;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class ProductRepoImpl implements ProductRepo {

    private final EntityManagerFactory factory;

    public ProductRepoImpl(EntityManagerFactory factory){
        this.factory = factory;
    }


    @Override
    public List<String> fetchProducts() {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            Query query = manager.createNamedQuery("fetchProduct");
            return query.getResultList();
        }catch (NoResultException e){
            e.printStackTrace();
            return Collections.emptyList();
        }finally {
            if(manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public ProductEntity save(ProductEntity entity) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.persist(entity);
            manager.getTransaction().commit();
            return entity;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public PurchaseEntity savePurchase(PurchaseEntity purchaseEntity) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.persist(purchaseEntity);
            manager.getTransaction().commit();
            return purchaseEntity;
        }catch (Exception r){
            r.printStackTrace();
            return null;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public List<PurchaseEntity> fetchPurchase() {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            Query query = manager.createNamedQuery("fetchPurchase");
            return query.getResultList();
        }catch (NoResultException r){
            r.printStackTrace();
            return  null;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public List<PurchaseEntity> findByStatus(ApprovalStatus approvalStatus) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            Query query = manager.createNamedQuery("approval");
            query.setParameter("status",approvalStatus);
            return query.getResultList();
        }catch (Exception e){
            e.printStackTrace();
            return Collections.emptyList();
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

}
