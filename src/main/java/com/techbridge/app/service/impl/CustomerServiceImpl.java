package com.techbridge.app.service.impl;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.RegistrationEntity;
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
        List<CustomerEntity> entity = repo.fecthDetails();
       List<CustomerDto> customerDto = new ArrayList<>();
        for (CustomerEntity ls : entity) {
            CustomerDto dto = new CustomerDto();
            BeanUtils.copyProperties(ls, dto);
            customerDto.add(dto);
        }
        return customerDto;
    }

    @Override
    public List<RegistrationDto> fetchUserDetails() {
        List<RegistrationEntity> entityList = repo.fecthUserDetails();
        List<RegistrationDto>  dtoList = new ArrayList<>();
        for (RegistrationEntity entity : entityList){
            RegistrationDto dto = new RegistrationDto();
            BeanUtils.copyProperties(entity,dto);
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public boolean remove(int id) {
        if (id == 0){
            return false;
        }
        repo.remove(id);
        return true;
    }


    @Override
    public boolean removeCustomer(int id) {
        if (id == 0){
            return false;
        }
        repo.removeCustomer(id);
        return true;
    }

    @Override
    public CustomerDto displayUser(String email) {
        CustomerEntity entity = repo.checkEmail(email);
        CustomerDto dto = new CustomerDto();
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }

    @Override
    public CustomerDto updateCustomer(int id) {
       CustomerEntity entity = repo.findById(id);
        System.out.println("No customer found for ID: " + id);
        if (entity == null){
            return null;
        }
        CustomerDto customerDto = new CustomerDto();
        BeanUtils.copyProperties(entity,customerDto);
        return customerDto;
    }

    @Override
    public RegistrationDto updateUser(RegistrationDto registrationDto) {
        if (registrationDto == null){
            return null;
        }
        RegistrationEntity entity = new RegistrationEntity();
        BeanUtils.copyProperties(registrationDto, entity);
        System.out.println("Entity in service -> "+entity);
        boolean userUpdated = repo.updateUserDetails(entity);
        System.out.println("User updated -> "+userUpdated);
        return registrationDto;
    }


}
