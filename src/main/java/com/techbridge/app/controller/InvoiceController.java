package com.techbridge.app.controller;

import com.techbridge.app.dto.SalesDto;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.InvoiceService;
import com.techbridge.app.service.PurchaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Slf4j
@Controller
@RequestMapping("purchase")
public class InvoiceController {


    private InvoiceService invoiceService;

    private PurchaseService purchaseService;

    public InvoiceController(InvoiceService invoiceService,PurchaseService purchaseService){
        this.invoiceService = invoiceService;
        this.purchaseService = purchaseService;
    }



    @GetMapping("/downloadInvoice")
    public void downloadInvoice(@RequestParam("productCode") String productCode, HttpServletResponse response) throws IOException {

        log.info("Invoice invoked");

        PurchaseEntity purchase = purchaseService.getByProductCode(productCode);
        byte[] pdf = invoiceService.generateInvoiceForPurchase(purchase);

        log.info("products: "+purchase);

        response.setContentType("application/pdf");
        response.setHeader(
                "Content-Disposition",
                "attachment; filename=Invoice_" + productCode + ".pdf");

        response.getOutputStream().write(pdf);
        response.getOutputStream().flush();
    }




}
