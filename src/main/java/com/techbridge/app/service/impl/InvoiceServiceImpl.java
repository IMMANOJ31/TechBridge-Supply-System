package com.techbridge.app.service.impl;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.InvoiceService;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;

@Service
public class InvoiceServiceImpl implements InvoiceService {

    @Override
    public byte[] generateInvoice(PurchaseEntity purchaseEntity) {

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, outputStream);

            document.open();

            document.add(new Paragraph("INVOICE"));
            document.add(new Paragraph("------------------------------"));
            document.add(new Paragraph("Customer: " + purchaseEntity.getCustomerName()));
            document.add(new Paragraph("Product: " + purchaseEntity.getProductCode()));
            document.add(new Paragraph("Quantity: " + purchaseEntity.getQuantity()));
            document.add(new Paragraph("Total Cost: " + purchaseEntity.getTotalCost()));
            document.add(new Paragraph("------------------------------"));

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return outputStream.toByteArray();
    }
}
