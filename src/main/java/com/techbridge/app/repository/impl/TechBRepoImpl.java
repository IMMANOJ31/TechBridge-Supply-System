package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.repository.TechBRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

@Repository
public class TechBRepoImpl implements TechBRepo {

    public TechBRepoImpl(){
        System.err.println("Repo invoked");
    }
    @Autowired
    EntityManagerFactory factory;


    @Override
    public boolean saveDetails(RegistrationEntity entity) {
        EntityManager manager = null;
        try{
            manager.getTransaction().begin();
            manager.persist(entity);
            manager.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            manager.close();
        }
        return true;
    }

    @Override
    public boolean existsEmailOrPhone(String email, String phoneNumber) {
        EntityManager manager = null;
        try {
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("doesUserExist");
            query.setParameter("emailId",email);
            query.setParameter("phoneId",phoneNumber);
            Object singleResult = query.getSingleResult();
            System.err.println(singleResult + "------------------> email&Phone repo");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            manager.close();
        }
        return true;
    }
}
