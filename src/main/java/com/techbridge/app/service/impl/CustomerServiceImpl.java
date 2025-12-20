package com.techbridge.app.service.impl;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.enums.CustomerType;
import com.techbridge.app.exception.IdValidationException;
import com.techbridge.app.repository.CustomerRepo;
import com.techbridge.app.service.CustomerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class CustomerServiceImpl implements CustomerService {

    private CustomerRepo repo;

    public CustomerServiceImpl(CustomerRepo repo){
        this.repo = repo;
    }


    @Override
    public boolean saveCustomerDetail(CustomerDto dto) {
        if (dto == null){
            return false;
        }
        CustomerEntity entity = new CustomerEntity();
        BeanUtils.copyProperties(dto,entity);
        log.info("Saved customer details: {}",entity);
        repo.saveDetails(entity);
        return true;
    }

    @Override
    public List<CustomerDto> fetchCustomerDetails() {
        List<CustomerEntity> entities = repo.fecthDetails();
        List<CustomerDto> customerDtos = new ArrayList<>();

        for (CustomerEntity entity : entities) {
            CustomerDto dto = new CustomerDto();
            BeanUtils.copyProperties(entity, dto);
            customerDtos.add(dto);
        }
        List<CustomerDto> debitors = fetchDebitors(customerDtos);
        log.info("Debitors: {}",debitors);
        return debitors;
    }

    private List<CustomerDto> fetchDebitors(List<CustomerDto> allCustomers) {
        return allCustomers.stream()
                .filter(dto -> dto.getCustomerType() == CustomerType.Debitors)
                .collect(Collectors.toList());
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
    public RegistrationDto fetchUserById(int id) {
        if (id == 0){
            throw new IdValidationException("Id cannot be zero");
        }
        RegistrationEntity entity = repo.fetchUserById(id);
        RegistrationDto dto = new RegistrationDto();
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }

    @Override
    public CustomerDto fetchCustomerById(int id) {
        if (id == 0){
            throw new IdValidationException("Id cannot be zero");
        }
        CustomerEntity entity = repo.fecthCustomerById(id);
        CustomerDto dto = new CustomerDto();
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }

    @Override
    public boolean removeCustomerById(int id) {
        if (id == 0){
            throw new IdValidationException("Id cannot be zero");
        }
        boolean b = repo.removeCustomer(id);
        log.info("Does customer details erased -> "+b);
        return true;
    }

    @Override
    public boolean removeUserById(int id) {
        if (id == 0){
            throw new IdValidationException("Id cannot be zero");
        }
        boolean remove = repo.removeUser(id);
        log.info("Does user details erased -> "+remove);
        return true;
    }

    @Override
    public CustomerDto updateCustomerDetails(CustomerDto dto) {
        if (dto == null){
            log.info("for updating customer detail: {}",dto);
            return null;
        }
        CustomerEntity entity = new CustomerEntity();
        BeanUtils.copyProperties(dto,entity);
        boolean b = repo.CustomerUpdate(entity);
        log.info("Customer details updated -> "+b);
        return dto;
    }

    @Override
    public RegistrationDto updateUserDetails(RegistrationDto dto) {
        if (dto == null){
            log.info("   ",dto);
            return null;
        }
        RegistrationEntity entity = new RegistrationEntity();
        BeanUtils.copyProperties(dto,entity);
        boolean b = repo.UserUpdate(entity);
        log.info("User details updated -> "+b);
        return dto;
    }

    @Override
    public List<PurchaseEntity> getPendingPurchases() {
        return repo.findPendingOrders();
    }

    @Override
    public List<CustomerDto> findAllCustomers() {
        return repo.fetchAllCustomers();
    }


}
