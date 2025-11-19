package com.techbridge.app.controller;

import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.repository.ProductRepo;
import com.techbridge.app.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {

    @Autowired
    private ProductRepo repo;

    @Autowired
    private InvoiceService invoiceService;

    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> downloadInvoice(@PathVariable int id) throws Exception {

        PurchaseEntity purchase = repo.findById(id);
        byte[] pdf = invoiceService.generateInvoice(purchase);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", "invoice_" + id + ".pdf");
        System.out.println("Invoice method");
        return new ResponseEntity<>(pdf, headers, HttpStatus.OK);
    }
}
