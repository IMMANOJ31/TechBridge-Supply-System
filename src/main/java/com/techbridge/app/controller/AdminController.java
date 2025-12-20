package com.techbridge.app.controller;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.CustomerService;
import com.techbridge.app.service.ProductService;
import com.techbridge.app.service.PurchaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/")
public class AdminController {

    private CustomerService service;

    private  ProductService productService;

    private PurchaseService purchaseService;

    public AdminController(CustomerService service,ProductService productService,PurchaseService purchaseService){
        this.service = service;
        this.productService = productService;
        this.purchaseService = purchaseService;
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
        log.info("Saved customer details: {}",dto);
        return "adminPage";
    }

    @GetMapping("listOfUsers")
    public String  viewUserPage(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size, Model model){
        List<RegistrationDto>  dtoList = service.fetchUserDetails();

        int totalUsers = dtoList.size();
        int totalPages = (int) Math.ceil((double) totalUsers / size);

        int start = (page - 1) * size;
        int end = Math.min(start + size,totalUsers);

        List<RegistrationDto> pagedUsers = dtoList.subList(start,end);

        model.addAttribute("listOfUser",pagedUsers);
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        return "usersList";
    }

    @GetMapping("listOfCustomers")
    public String viewCustomersPage(@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "10")int size,Model model){
        List<CustomerDto> dtoList = service.fetchCustomerDetails();

        int totalCustomers = dtoList.size();
        int totalPages = (int) Math.ceil((double) totalCustomers / size);

        int start = (page - 1) * size;
        int end = Math.min(start + size,totalCustomers);

        List<CustomerDto> pagedCustomers = dtoList.subList(start,end);

        model.addAttribute("listOfCustomer",pagedCustomers);
        model.addAttribute("totalCustomers", totalCustomers);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        return "customerList";
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

    @GetMapping("editCustomer")
    public String showCustomerUpdatePage(@RequestParam int id,Model model){
        CustomerDto dto = service.fetchCustomerById(id);
        model.addAttribute("dto",dto);
        return "updateCustomer";
    }
    @PostMapping("editCustomer")
    public String updateCustomer(@Valid CustomerDto dto, RedirectAttributes redirectAttributes){
        CustomerDto customerDto = service.updateCustomerDetails(dto);
        if (customerDto != null){
            redirectAttributes.addFlashAttribute("successMessage","Customer updated successfully");
        }else redirectAttributes.addFlashAttribute("error","Failed to update customer");
        return "redirect :customerList";
    }

    @GetMapping("editUser")
    public String showUserUpdatePage(@RequestParam int id, Model model){
        RegistrationDto dto = service.fetchUserById(id);
        model.addAttribute("dto",dto);
        return "updateUser";
    }

    @PostMapping("editUser")
    public String updateUser(@Valid RegistrationDto dto, RedirectAttributes redirectAttributes) {
        RegistrationDto registrationDto = service.updateUserDetails(dto);
        if (registrationDto != null) {
            redirectAttributes.addFlashAttribute("successMessage", "User updated successfully");
        } else redirectAttributes.addFlashAttribute("error", "Failed to update user");
        return "redirect :usersList";
    }

    @GetMapping("/admin")
    public String showAdminPage(Model model, HttpSession session) {
        List<PurchaseEntity> pending = productService.getPendingOrders();
        model.addAttribute("pendingOrders", pending);
        session.setAttribute("loggedInUser", session.getAttribute("loggedInUser"));
        return "adminPage";
    }

    @GetMapping("adminPage")
    public String adminPage(Model model) {
        List<PurchaseEntity> pendingOrders =purchaseService.findByStatus("PENDING");
        List<RegistrationDto> userList = service.findAllUsers();
        List<CustomerDto> customerList = service.findAllCustomers();

        model.addAttribute("pendingOrders", pendingOrders);
        model.addAttribute("userList", userList);
        model.addAttribute("customerList", customerList);
        return "adminPage";
    }


}
