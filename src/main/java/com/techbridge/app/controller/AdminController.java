package com.techbridge.app.controller;

import com.techbridge.app.dto.CustomerDto;
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


}
