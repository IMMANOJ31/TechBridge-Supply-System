package com.techbridge.app.repository.impl;

import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.repository.TechBRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;

@Repository
@Slf4j
public class TechBRepoImpl implements TechBRepo {

    private EntityManagerFactory factory;

    public TechBRepoImpl(EntityManagerFactory factory)
    {
        this.factory = factory;
        log.info("Invoked TechBRepoImpl");
    }

    @Override
    public boolean saveDetails(RegistrationEntity entity) {
        log.info("Saved Details -> Registration: {}",entity);
        EntityManager manager = null;
        try{
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.persist(entity);
            manager.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
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
            log.info("No user found");
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
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
            if (manager != null && manager.isOpen()){
                manager.close();
            }
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
        }catch (NoResultException e){
            return null;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public RegistrationEntity checkPhoneExist(String phoneNumber) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("phoneExist");
            query.setParameter("phone",phoneNumber);
            return (RegistrationEntity) query.getSingleResult();
        }catch (NoResultException e){
            return null;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public boolean saveLoginDetails(LoginEntity entity) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.persist(entity);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public boolean passwordUpdate(RegistrationEntity entity) {
        EntityManager manager = null;
        try{
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            manager.merge(entity);
            manager.getTransaction().commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public void clearOtp() {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("resetOtp");
            query.executeUpdate();
            manager.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public boolean saveOtp(String email, String otp) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("saveOtp");
            query.setParameter("email",email);
            query.setParameter("otp",otp);
            query.executeUpdate();
            manager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }

    }
}
