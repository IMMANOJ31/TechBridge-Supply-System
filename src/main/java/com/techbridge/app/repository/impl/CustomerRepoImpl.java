package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

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
    public List<CustomerEntity> fecthDetails() {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("getAllCustomers");
            manager.getTransaction().commit();
            return query.getResultList();
        }catch (NoResultException e){
            e.printStackTrace();
            return null;
        }finally {
            manager.close();
        }
    }


}
