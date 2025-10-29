package com.techbridge.app.controller;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
public class AdminController {

    @Autowired
    CustomerService service;

    @GetMapping("addCustomer")
    public String addCustomerPage(){
        return "addCustomer";
    }

    @GetMapping("viewCustomer")
    public String viewCustomerPage(Model model){
        List<CustomerDto> dtos = service.fetchCustomerDetails();
        model.addAttribute("listOfCustomers",dtos);
        return "viewCustomer";
    }

    @PostMapping("saveCustomer")
    public String saveCustomerDetails(@Valid CustomerDto dto){
        service.saveCustomerDetail(dto);
        System.out.println(dto);
        return "adminPage";
    }

    @GetMapping("viewUser")
    public String  viewUserPage(Model model){
        List<RegistrationDto>  dtoList = service.fetchUserDetails();
        model.addAttribute("listOfUsers",dtoList);
        return "viewUser";
    }

    @GetMapping("logout")
    public String logout(){
        return "index";
    }

    @GetMapping("deleteUser")
    public String deleteUser(int id){
        service.remove(id);
        return "viewCustomer";
    }

    @GetMapping("deleteCustomer")
    public String deleteCustomer(int id){
        service.removeCustomer(id);
        return "viewCustomer";
    }

    @GetMapping("editUser")
    public String updateUser(int id){
        service.update(id);
        return "updateUser";
    }

}
