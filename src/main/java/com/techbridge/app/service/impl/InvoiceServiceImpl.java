package com.techbridge.app.service.impl;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.InvoiceService;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;

@Service
public class InvoiceServiceImpl implements InvoiceService {

    @Override
    public byte[] generateInvoiceForPurchase(PurchaseEntity p) {

        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();

            Font titleFont = new Font(Font.HELVETICA, 18, Font.BOLD);
            Font headerFont = new Font(Font.HELVETICA, 12, Font.BOLD);
            Font normalFont = new Font(Font.HELVETICA, 11);

            // ===== Company Header =====
            Paragraph company = new Paragraph("TECHBRIDGE SUPPLY SYSTEM\n", titleFont);
            company.setAlignment(Element.ALIGN_CENTER);
            document.add(company);

            Paragraph tagLine = new Paragraph("Enterprise Solutions\n\n", normalFont);
            tagLine.setAlignment(Element.ALIGN_CENTER);
            document.add(tagLine);

            // ===== Invoice Info =====
            document.add(new Paragraph("INVOICE", headerFont));
            document.add(new Paragraph("Invoice No : INV-" + p.getId()));
            document.add(new Paragraph("Invoice Date : " + java.time.LocalDate.now()));
            document.add(new Paragraph("\n"));

            // ===== Customer Info =====
            document.add(new Paragraph("Bill To:", headerFont));
            document.add(new Paragraph("Customer Name : " + p.getCustomerName()));
            document.add(new Paragraph("\n"));

            // ===== Table =====
            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            table.addCell("Item Name");
            table.addCell("Product Code");
            table.addCell("Quantity");
            table.addCell("Unit Price");
            table.addCell("Total");

            table.addCell(p.getItemName());
            table.addCell(p.getProductCode());
            table.addCell(String.valueOf(p.getQuantity()));
            table.addCell("₹" + p.getPurchasePrice());
            table.addCell("₹" + p.getTotalCost());

            document.add(table);

            // ===== Summary =====
            document.add(new Paragraph("Total Amount : ₹" + p.getTotalCost(), headerFont));
            document.add(new Paragraph("Status : " + p.getStatus(), headerFont));

            // ===== Footer =====
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("This is a system generated invoice.", normalFont));
            document.add(new Paragraph("Thank you for doing business with us.", normalFont));

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return out.toByteArray();
    }

}
