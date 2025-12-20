package com.techbridge.app.repository;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.PurchaseEntity;
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

    boolean CustomerUpdate(CustomerEntity entity);

    boolean UserUpdate(RegistrationEntity entity);

    List<PurchaseEntity> findPendingOrders();

 boolean markAsApproved(int id);

 boolean markAsRejected(int id);

 List<CustomerDto> fetchAllCustomers();

 List<RegistrationDto> fetchAllUsers();
}
