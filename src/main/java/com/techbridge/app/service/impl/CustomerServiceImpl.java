package com.techbridge.app.service.impl;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.repository.CustomerRepo;
import com.techbridge.app.service.CustomerService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerRepo repo;

    @Override
    public boolean saveCustomerDetail(CustomerDto dto) {
        if (dto == null){
            return false;
        }
        CustomerEntity entity = new CustomerEntity();
        BeanUtils.copyProperties(dto,entity);
        System.out.println(entity);
        repo.saveDetails(entity);
        return true;
    }

    @Override
    public List<CustomerDto> fetchCustomerDetails(){
       CustomerDto customerDto = new CustomerDto();
       List<CustomerEntity> entity = repo.fecthDetails();
       BeanUtils.copyProperties(entity,customerDto);
       return (List<CustomerDto>) customerDto;
    }

}
