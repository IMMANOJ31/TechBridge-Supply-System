package com.techbridge.app.repository.impl;

import com.techbridge.app.dto.SalesDto;
import com.techbridge.app.entity.SalesEntity;
import com.techbridge.app.repository.SalesRepo;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

@Repository
public class SalesRepoImpl implements SalesRepo {

    private EntityManagerFactory  factory;

    @Override
    public boolean dataSaved(SalesEntity salesEntity) {
        EntityManager  manager = null;
        try{
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.persist(salesEntity);
            manager.getTransaction().commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            if(manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }
}
