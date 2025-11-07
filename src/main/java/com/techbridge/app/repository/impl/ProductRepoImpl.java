package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.ProductEntity;
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
}
