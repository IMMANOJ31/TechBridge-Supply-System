package com.techbridge.app.controller;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.repository.ProductRepo;
import com.techbridge.app.service.InvoiceService;
import com.techbridge.app.service.PurchaseService;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {

    private ProductRepo repo;

    private InvoiceService invoiceService;

    private PurchaseService purchaseService;

    public InvoiceController(ProductRepo productRepo,InvoiceService invoiceService,PurchaseService purchaseService){
        this.repo = productRepo;
        this.invoiceService = invoiceService;
        this.purchaseService = purchaseService;
    }

    @GetMapping("/downloadInvoice")
    public String downloadInvoice(@RequestParam("productCode") String productCode,HttpServletResponse response) throws IOException {

        PurchaseEntity purchase = purchaseService.getByProductCode(productCode);
        byte[] pdf = invoiceService.generateInvoiceForPurchase(purchase);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition","attachment; filename=Invoice_" + productCode + ".pdf");

        response.getOutputStream().write(pdf);
        response.getOutputStream().flush();

        return "purchaseList";
    }


}
