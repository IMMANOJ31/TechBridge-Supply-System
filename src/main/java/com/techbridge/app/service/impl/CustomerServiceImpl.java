package com.techbridge.app.service.impl;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.enums.CustomerType;
import com.techbridge.app.repository.CustomerRepo;
import com.techbridge.app.service.CustomerService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
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
    public List<CustomerDto> fetchCustomerDetails() {
        List<CustomerEntity> entities = repo.fecthDetails();
        List<CustomerDto> customerDtos = new ArrayList<>();

        for (CustomerEntity entity : entities) {
            CustomerDto dto = new CustomerDto();
            BeanUtils.copyProperties(entity, dto);
            customerDtos.add(dto);
        }
        List<CustomerDto> debitors = fetchDebitors(customerDtos);
        System.out.println("Debitors: " + debitors);
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
            System.out.println("id is zero");
            return null;
        }
        RegistrationEntity entity = repo.fetchUserById(id);
        RegistrationDto dto = new RegistrationDto();
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }

    @Override
    public CustomerDto fetchCustomerById(int id) {
        if (id == 0){
            System.out.println("id is zero");
            return null;
        }
        CustomerEntity entity = repo.fecthCustomerById(id);
        CustomerDto dto = new CustomerDto();
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }

    @Override
    public boolean removeCustomerById(int id) {
        if (id == 0){
            System.out.println("id is zero");
            return false;
        }
        boolean b = repo.removeCustomer(id);
        System.out.println("Does customer details erased -> "+b);
        return true;
    }

    @Override
    public boolean removeUserById(int id) {
        if (id == 0){
            System.out.println("id is zero");
            return false;
        }
        boolean remove = repo.removeUser(id);
        System.out.println("Does user details erased -> "+remove);
        return true;
    }

    @Override
    public CustomerDto updateCustomerDetails(CustomerDto dto) {
        if (dto == null){
            System.out.println(dto);
            return null;
        }
        CustomerEntity entity = new CustomerEntity();
        BeanUtils.copyProperties(dto,entity);
        boolean b = repo.CustomerUpdate(entity);
        System.out.println("Customer details updated -> "+b);
        return dto;
    }

    @Override
    public RegistrationDto updateUserDetails(RegistrationDto dto) {
        if (dto == null){
            System.out.println(dto);
            return null;
        }
        RegistrationEntity entity = new RegistrationEntity();
        BeanUtils.copyProperties(dto,entity);
        boolean b = repo.UserUpdate(entity);
        System.out.println("User details updated -> "+b);
        return dto;
    }

    @Override
    public List<PurchaseEntity> getPendingPurchases() {
        return repo.findPendingOrders();
    }

    @Override
    public boolean approval(int id) {
        return repo.markAsApproved(id);
    }

    @Override
    public boolean reject(int id) {
        return repo.markAsRejected(id);
    }


}
