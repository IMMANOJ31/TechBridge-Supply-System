package com.techbridge.app.repository;

import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.RegistrationEntity;

import java.util.List;

public interface CustomerRepo {
    boolean saveDetails(CustomerEntity entity);

   List<CustomerEntity> fecthDetails();

    List<RegistrationEntity> fecthUserDetails();

    boolean remove(int id);



    boolean removeCustomer(int id);

    CustomerEntity checkEmail(String email);

    CustomerEntity checkCustomerId(int id);

    boolean updateCustomer(int id);
}
