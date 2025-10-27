package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

@Repository
public class CustomerRepoImpl implements CustomerRepo {

    @Autowired
    EntityManagerFactory factory;

    @Override
    public boolean saveDetails(CustomerEntity entity) {
        EntityManager manager =null;
        try{
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.persist(entity);
            manager.getTransaction().commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            manager.close();
        }
    }

    @Override
    public boolean fetchDetails(CustomerEntity entity) {
        return false;
    }
}
