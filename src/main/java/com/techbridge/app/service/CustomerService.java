package com.techbridge.app.service;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.entity.CustomerEntity;

import javax.validation.Valid;

public interface CustomerService {
    boolean saveCustomerDetail(@Valid CustomerDto dto);

    CustomerDto fetchCustomerDetails(CustomerEntity entity);
}
