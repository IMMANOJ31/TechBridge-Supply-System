package com.techbridge.app.controller;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.EmailService;
import com.techbridge.app.service.InvoiceService;
import com.techbridge.app.service.PurchaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/")
public class OrderController {

    private static final String REDIRECT_TO_NOTIFICATION = "redirect:notifications";

    private PurchaseService purchaseService;
    private InvoiceService invoiceService;

    public OrderController(PurchaseService purchaseService,InvoiceService invoiceService){
        this.purchaseService = purchaseService;
        this.invoiceService = invoiceService;
    }


    @GetMapping("/api/pendingOrders")
    public @ResponseBody List<PurchaseEntity> getPendingOrders(String status) {
        log.info("Pending orders");
        return purchaseService.findByStatus(status);
    }


    @GetMapping("notifications")
    public String showNotification(Model model,@RequestParam(required = false) String status) {

        if (status == null || status.isEmpty()) {
            status = "PENDING";
        }

        model.addAttribute("data", purchaseService.findByStatus(status));
        return "notifications";
    }

    @PostMapping("approvePurchase")
    public String approvePurchase(@RequestParam int id) {
    PurchaseEntity purchase = purchaseService.approval(id);
    invoiceService.generateInvoiceForPurchase(purchase);
    return REDIRECT_TO_NOTIFICATION;
}


    @PostMapping("rejectPurchase")
    public String rejectPurchase(@RequestParam int id) {
        PurchaseEntity reject = purchaseService.reject(id);
        invoiceService.generateInvoiceForPurchase(reject);
        return REDIRECT_TO_NOTIFICATION;
    }

    @PostMapping("holdPurchase")
    public String holdPurchase(@RequestParam int id) {
        PurchaseEntity hold = purchaseService.hold(id);
        invoiceService.generateInvoiceForPurchase(hold);
        return REDIRECT_TO_NOTIFICATION;
    }
}
