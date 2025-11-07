package com.techbridge.app.controller;

import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
public class UserController {

    private final ProductService productService;

    public UserController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("salesPage")
    public String salesPage(@RequestParam(defaultValue = "Sales")String voucherType, Model model) {

        List<String> productGroups = productService.getAllProductGroups();
        model.addAttribute("productGroups", productGroups);
        model.addAttribute("voucherType", voucherType);
        return "salesPage";
    }

    @GetMapping("/purchasePage")
    public String purchasePage() {
        return "purchasePage";
    }

    @GetMapping("userPage")
    public String returnToUserPage(){
        return "userPage";
    }
}
