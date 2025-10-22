package com.techbridge.app.repository.impl;

import com.techbridge.app.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManagerFactory;

@Repository
public class CustomerRepoImpl implements CustomerRepo {

    @Autowired
    EntityManagerFactory factory;
}
