package com.techbridge.app.controller;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
public class OrderController {

    @Autowired
    PurchaseService purchaseService;

    @GetMapping("/api/pendingOrders")
    public @ResponseBody List<PurchaseEntity> getPendingOrders(String status) {
        return purchaseService.getPendingPurchases(status);
    }


    @GetMapping("notifications")
    public String showNotification(Model model,String status) {
        model.addAttribute("pendingOrders", purchaseService.getPendingPurchases(status));
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
