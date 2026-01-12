package com.techbridge.app.controller;

import com.techbridge.app.dto.CustomerDto;
import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.dto.PurchaseDto;
import com.techbridge.app.dto.SalesDto;
import com.techbridge.app.entity.CustomerEntity;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.enums.ApprovalStatus;
import com.techbridge.app.service.CustomerService;
import com.techbridge.app.service.ProductService;
import com.techbridge.app.service.SalesService;
import com.techbridge.app.util.MailNotify;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/")
public class UserController {

    private final ProductService productService;

    private final CustomerService customerService;

    private final SalesService salesService;

    private final MailNotify mailNotify;

    public UserController(ProductService productService, CustomerService customerService, SalesService salesService, MailNotify mailNotify){
        this.productService = productService;
        this.customerService = customerService;
        this.salesService = salesService;
        this.mailNotify = mailNotify;
    }

    @GetMapping("purchaseOrder")
    public String showPurchasePage(@RequestParam(defaultValue = "Purchase") String voucherType,
                                   @RequestParam(required = false) String customerName,
                                   Model model) {
        log.info("Purchase page invked");
        List<String> productGroups = productService.getAllProductGroups();
        List<CustomerDto> customers = customerService.fetchCustomerDetails();

        model.addAttribute("productGroups", productGroups);
        model.addAttribute("voucherType", voucherType);
        model.addAttribute("customers", customers);
        model.addAttribute("customerName", customerName);
        model.addAttribute("productDto", new ProductDto());
        return "purchaseOrder";
    }

    @PostMapping("purchaseOrder")
    public String savePurchase(@ModelAttribute PurchaseDto dto) {
        log.info("saving purchase invoked");
        dto.setStatus(ApprovalStatus.PENDING);
        PurchaseEntity purchaseEntity = productService.savePurchaseDetail(dto);
        log.info("Saved: {}",purchaseEntity);
        return "redirect:/purchaseDashboard";
    }


    @GetMapping("purchaseListPage")
    public String purchaseList(Model model){
        log.info("Purchase list invoked");
        List<PurchaseDto> purchaseEntity = productService.fetchAllPurchaseList();
        log.info("Purchase List: {}",purchaseEntity);
        model.addAttribute("purchaseEntity",purchaseEntity);
        return "purchaseList";
    }

    @GetMapping("saveSalesOrder")
    public String productList(Model model){
        log.info("Product list invoked");
        List<ProductDto> productDtos = productService.fetchAllProductList();
        List<CustomerEntity> debitors = customerService.fetchDebitors();
        model.addAttribute("products",productDtos);
        model.addAttribute("debitors",debitors);
        return "salesPage";
    }

    @PostMapping("saveSalesOrder")
    public String salesOrder(@ModelAttribute SalesDto salesDto){
        salesService.save(salesDto);
        String confirmationMail = mailNotify.sendSalesConfirmationMail(salesDto.getEmail(), salesDto.getCustomerName(), salesDto.getId());
        log.info("Sales mail: {}",confirmationMail);
        return "userPage";
    }


}
