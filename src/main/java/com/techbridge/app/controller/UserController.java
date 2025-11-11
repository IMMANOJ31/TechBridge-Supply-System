package com.techbridge.app.controller;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.CustomerService;
import com.techbridge.app.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
public class UserController {

    private final ProductService productService;

    private final CustomerService customerService;

    public UserController(ProductService productService,CustomerService customerService){
        this.productService = productService;
        this.customerService = customerService;
    }

    @GetMapping("/purchaseOrder")
    public String showPurchasePage(@RequestParam(defaultValue = "Purchase") String voucherType,
                                   @RequestParam(required = false) String customerName,
                                   Model model) {
        List<String> productGroups = productService.getAllProductGroups();
        List<CustomerDto> customers = customerService.fetchCustomerDetails();

        model.addAttribute("productGroups", productGroups);
        model.addAttribute("voucherType", voucherType);
        model.addAttribute("customers", customers);
        model.addAttribute("customerName", customerName);
        return "purchaseOrder";
    }


    @PostMapping("purchaseOrder")
    public String savePurchase(@ModelAttribute ProductDto dto, Model model) {
        PurchaseEntity purchaseEntity = productService.savePurchaseDetail(dto);
        System.out.println("Saved: " + purchaseEntity);
        return "redirect:/purchaseOrder";
    }


    @GetMapping("purchaseDashboard")
    public String purchaseDashboard(){
        return "purchaseDashboard";
    }

    @GetMapping("salesPage")
    public String salesPage() {
        return "salesPage";
    }

    @GetMapping("userPage")
    public String returnToUserPage(){
        return "userPage";
    }

}
