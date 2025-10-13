package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.UserEntity;
import com.techbridge.app.repository.TechBRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

@Repository
public class TechBRepoImpl implements TechBRepo {

    public TechBRepoImpl(){
        System.err.println("Repo invoked");
    }
    @Autowired
    EntityManagerFactory factory;

    @Override
    public String saveDetails(UserEntity entity) {
        EntityManager manager = null;
        try {
            manager.getTransaction().begin();
            manager.persist(entity);
            manager.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            manager.close();
        }
        return "Profile data stored!!!!!!";
    }
}
