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
        System.out.println(entity);
        EntityManager manager = null;
        try{
            manager = factory.createEntityManager();
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
    public RegistrationEntity existsEmailOrPhone(String email, String phoneNumber) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("doesUserExist");
            query.setParameter("emailId",email);
            query.setParameter("phoneId",phoneNumber);
            return (RegistrationEntity) query.getSingleResult();
        }catch (Exception e){
            System.err.println("No user found");
        }finally {
            manager.close();
        }
        return null;
    }

    @Override
    public boolean existsPassword(String password) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("passwordExists");
            query.setParameter("pass",password);
            Long count = (Long) query.getSingleResult();
            return count >0;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            manager.close();
        }
        return  true;
    }

    @Override
    public RegistrationEntity checkMailExist(String email) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("mailExist");
            query.setParameter("mailId",email);
            return (RegistrationEntity) query.getSingleResult();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }finally {
            manager.close();
        }
    }
}
