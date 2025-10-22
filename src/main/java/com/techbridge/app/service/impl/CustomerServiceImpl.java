package com.techbridge.app.service.impl;

import com.techbridge.app.repository.CustomerRepo;
import com.techbridge.app.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerRepo repo;
}
