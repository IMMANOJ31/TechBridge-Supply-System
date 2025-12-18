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
    private EmailService emailService;

    public OrderController(PurchaseService purchaseService,InvoiceService invoiceService,EmailService emailService){
        this.purchaseService = purchaseService;
        this.invoiceService = invoiceService;
        this.emailService = emailService;
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
    byte[] pdf = invoiceService.generateInvoice(purchase);
//    emailService.sendInvoice(,pdf,"invoice_" + id + ".pdf");
    return REDIRECT_TO_NOTIFICATION;
}


    @PostMapping("rejectPurchase")
    public String rejectPurchase(@RequestParam int id) {
        purchaseService.reject(id);
        return REDIRECT_TO_NOTIFICATION;
    }

    @PostMapping("holdPurchase")
    public String holdPurchase(@RequestParam int id) {
        purchaseService.hold(id);
        return REDIRECT_TO_NOTIFICATION;
    }
}
