package com.techbridge.app.repository;

import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.RegistrationEntity;

import java.util.List;

public interface CustomerRepo {
    boolean saveDetails(CustomerEntity entity);

   List<CustomerEntity> fecthDetails();

    List<RegistrationEntity> fecthUserDetails();

    boolean removeUser(int id);

    CustomerEntity checkEmail(String email);

    RegistrationEntity fetchUserById(int id);

    CustomerEntity fecthCustomerById(int id);

    boolean removeCustomer(int id);
}
