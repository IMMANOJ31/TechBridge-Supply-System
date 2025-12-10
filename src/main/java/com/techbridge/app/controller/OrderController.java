package com.techbridge.app.controller;

import com.techbridge.app.entity.PurchaseEntity;
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

    private PurchaseService purchaseService;

    public OrderController(PurchaseService purchaseService){
        this.purchaseService = purchaseService;
    }


    @GetMapping("/api/pendingOrders")
    public @ResponseBody List<PurchaseEntity> getPendingOrders(String status) {
        log.info("Pending orders");
        return purchaseService.findByStatus(status);
    }


    @GetMapping("notifications")
    public String showNotification(Model model,
                                   @RequestParam(required = false) String status) {

        if (status == null || status.isEmpty()) {
            status = "PENDING";
        }

        model.addAttribute("data", purchaseService.findByStatus(status));
        return "notifications";
    }


    @PostMapping("approvePurchase")
    public String approvePurchase(@RequestParam int id) {
        purchaseService.approval(id);
        return "redirect:notifications";
    }

    @PostMapping("rejectPurchase")
    public String rejectPurchase(@RequestParam int id) {
        purchaseService.reject(id);
        return "redirect:notifications";
    }

    @PostMapping("holdPurchase")
    public String holdPurchase(@RequestParam int id) {
        purchaseService.hold(id);
        return "redirect:notifications";
    }
}
