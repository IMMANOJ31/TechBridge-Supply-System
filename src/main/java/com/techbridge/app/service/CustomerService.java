package com.techbridge.app.service;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.RegistrationEntity;

import javax.validation.Valid;
import java.util.List;

public interface CustomerService {
    boolean saveCustomerDetail(@Valid CustomerDto dto);


    List<CustomerDto> fetchCustomerDetails();

    List<RegistrationDto> fetchUserDetails();

    RegistrationDto fetchUserById(int id);

    CustomerDto fetchCustomerById(int id);

    boolean removeCustomerById(int id);

    boolean removeUserById(int id);

    CustomerDto updateCustomerDetails(@Valid CustomerDto dto);

    RegistrationDto updateUserDetails(@Valid RegistrationDto dto);
}
