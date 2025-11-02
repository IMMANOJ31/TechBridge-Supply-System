package com.techbridge.app.controller;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
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

    @GetMapping("listOfUsers")
    public String  viewUserPage(Model model){
        List<RegistrationDto>  dtoList = service.fetchUserDetails();
        model.addAttribute("listOfUser",dtoList);
        return "usersList";
    }

    @GetMapping("listOfCustomers")
    public String viewCustomersPage(Model model){
        List<CustomerDto> dtoList = service.fetchCustomerDetails();
        model.addAttribute("listOfCustomer",dtoList);
        return "customerList";
    }

    @GetMapping("logout")
    public String logout(){
        return "index";
    }

    @GetMapping("addUser")
    public String addUser(){
        return "addUserPage";
    }

    @GetMapping("adminPage")
    public String adminPage(){
        return "adminPage";
    }

    @GetMapping("viewUser")
    public String showUserProfile(@RequestParam int id, Model model){
        RegistrationDto dto = service.fetchUserById(id);
        model.addAttribute("dto",dto);
        return "userProfile";
    }

    @GetMapping("customerProfile")
    public String showCustomerPage(@RequestParam int id,Model model){
        CustomerDto dto = service.fetchCustomerById(id);
        model.addAttribute("dto",dto);
        return "customerProfilePage";
    }

    @PostMapping("deleteCustomer")
    public String deleteCustomer(@RequestParam int id){
        service.removeCustomerById(id);
        return "redirect:customerList";
    }

    @PostMapping("deleteUser")
    public String deleteUser(@RequestParam int id) {
        service.removeUserById(id);
        return "redirect:usersList";
    }
}
