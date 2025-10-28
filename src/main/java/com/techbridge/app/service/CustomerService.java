package com.techbridge.app.service;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.CustomerEntity;

import javax.validation.Valid;
import java.util.List;

public interface CustomerService {
    boolean saveCustomerDetail(@Valid CustomerDto dto);


    List<CustomerDto> fetchCustomerDetails();

    List<RegistrationDto> fetchUserDetails();
}
