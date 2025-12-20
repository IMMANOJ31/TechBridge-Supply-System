package com.techbridge.app.repository.impl;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.repository.CustomerRepo;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class CustomerRepoImpl implements CustomerRepo {

    private EntityManagerFactory factory;
    public CustomerRepoImpl(EntityManagerFactory factory){
        this.factory = factory;
    }

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
            if (manager != null && manager.isOpen()){
                manager.close();
            }
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
            return Collections.emptyList();
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public List<RegistrationEntity> fecthUserDetails() {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("getByRole");
            manager.getTransaction().commit();
           return query.getResultList();
        }catch (NoResultException e){
            e.printStackTrace();
            return Collections.emptyList();
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public boolean removeUser(int id) {
        EntityManager manager = null;
        try{
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("removeUser");
            query.setParameter("id",id);
            query.executeUpdate();
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
    public CustomerEntity checkEmail(String email) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("checkEmail");
            query.setParameter("email", email);
            manager.getTransaction().commit();
            return (CustomerEntity) query.getSingleResult();
        } catch (NoResultException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (manager != null && manager.isOpen()) {
                manager.close();
            }
        }
    }

    @Override
    public RegistrationEntity fetchUserById(int id) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("getUserById");
            query.setParameter("id", id);
            manager.getTransaction().commit();
            return (RegistrationEntity) query.getSingleResult();
        } catch (NoResultException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (manager != null && manager.isOpen()) {
                manager.close();
            }
        }
    }

    @Override
    public CustomerEntity fecthCustomerById(int id) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("getCustomerById");
            query.setParameter("id",id);
            manager.getTransaction().commit();
            return  (CustomerEntity) query.getSingleResult();
        }catch (NoResultException e){
            e.printStackTrace();
            return null;
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public boolean removeCustomer(int id) {
        EntityManager manager = null;
        try{
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("removeCustomer");
            query.setParameter("id",id);
            query.executeUpdate();
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
    public boolean CustomerUpdate(CustomerEntity entity) {
        EntityManager manager = null;
        try {
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
    public boolean UserUpdate(RegistrationEntity entity) {
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
            if (manager != null && manager.isOpen()) {
                manager.close();
            }
        }
    }

    @Override
    public List<PurchaseEntity> findPendingOrders() {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            return manager.createNamedQuery("pendingOrder", PurchaseEntity.class).getResultList();
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public boolean markAsApproved(int id) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            int updated = manager.createNamedQuery("approved").setParameter("id",id).executeUpdate();
            manager.getTransaction().commit();
            return updated > 0;
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
    public boolean markAsRejected(int id) {
        EntityManager manager = null;
        try {
            manager = factory.createEntityManager();
            manager.getTransaction().begin();
            int updated = manager.createNamedQuery("rejected").setParameter("id",id).executeUpdate();
            manager.getTransaction().commit();
            return updated > 0;
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
    public List<CustomerDto> fetchAllCustomers() {
        EntityManager manager = null;
        try{
            manager = factory.createEntityManager();
            Query query = manager.createNamedQuery("getAllCustomerForAdmin");
            return query.getResultList();
        }catch (NoResultException r){
            r.printStackTrace();
            return Collections.emptyList();
        }finally {
            if (manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }
}
