package com.techbridge.app.repository;

import com.techbridge.app.entity.CustomerEntity;

import java.util.List;

public interface CustomerRepo {
    boolean saveDetails(CustomerEntity entity);

   List<CustomerEntity> fecthDetails();
}
