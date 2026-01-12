package com.techbridge.app.service.impl;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.techbridge.app.dto.SalesDto;
import com.techbridge.app.entity.PurchaseEntity;
import com.techbridge.app.service.InvoiceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.File;

@Service
@Slf4j
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

    @Override
    public File generateInvoicePdfForSales(SalesDto salesDto) {
        File file = new File("Invoice_" + System.currentTimeMillis() + ".pdf");

        try (PDDocument document = new PDDocument()) {

            PDPage page = new PDPage();
            document.addPage(page);

            PDPageContentStream content = new PDPageContentStream(document, page);

            // ===================== HEADER ======================
            content.setFont(PDType1Font.HELVETICA_BOLD, 20);
            content.beginText();
            content.newLineAtOffset(50, 750);
            content.showText("TechBridge Solutions");
            content.endText();

            content.setFont(PDType1Font.HELVETICA, 12);
            content.beginText();
            content.newLineAtOffset(50, 730);
            content.showText("123 Corporate Park, Bangalore, India");
            content.newLineAtOffset(0, -15);
            content.showText("Email: support@techbridge.com | Phone: +91 9876543210");
            content.newLineAtOffset(0, -15);
            content.showText("GSTIN: 29ABCDE1234F2Z5");
            content.endText();

            // ===================== INVOICE TITLE ======================
            content.setFont(PDType1Font.HELVETICA_BOLD, 18);
            content.beginText();
            content.newLineAtOffset(400, 750);
            content.showText("INVOICE");
            content.endText();

            // ===================== CUSTOMER BOX ======================
            content.setFont(PDType1Font.HELVETICA_BOLD, 14);
            content.beginText();
            content.newLineAtOffset(50, 680);
            content.showText("Bill To:");
            content.endText();

            content.setFont(PDType1Font.HELVETICA, 12);
            content.beginText();
            content.newLineAtOffset(50, 660);
            content.showText("Customer Name: " + salesDto.getCustomerName());
            content.newLineAtOffset(0, -15);
            content.showText("Email: " + salesDto.getEmail());
            content.newLineAtOffset(0, -15);
            content.showText("Sales Date: " + salesDto.getSalesDate());
            content.endText();

            // ===================== TABLE HEADER ======================
            int y = 610;

            content.setFont(PDType1Font.HELVETICA_BOLD, 12);
            content.beginText();
            content.newLineAtOffset(50, y);
            content.showText("SL");
            content.newLineAtOffset(50, 0);
            content.showText("Product");
            content.newLineAtOffset(200, 0);
            content.showText("Qty");
            content.newLineAtOffset(50, 0);
            content.showText("Price");
            content.newLineAtOffset(70, 0);
            content.showText("Total");
            content.endText();

            // ===================== TABLE ROW ======================
            y -= 20;

            content.setFont(PDType1Font.HELVETICA, 12);
            content.beginText();
            content.newLineAtOffset(50, y);
            content.showText("1");
            content.newLineAtOffset(50, 0);
            content.showText(salesDto.getProductName());
            content.newLineAtOffset(200, 0);
            content.showText(String.valueOf(salesDto.getQuantity()));
            content.newLineAtOffset(50, 0);
            content.showText(String.valueOf(salesDto.getSellingPrice()));
            content.newLineAtOffset(70, 0);
            content.showText(String.valueOf(salesDto.getTotalAmount()));
            content.endText();

            // ===================== TOTAL ======================
            content.setFont(PDType1Font.HELVETICA_BOLD, 14);
            content.beginText();
            content.newLineAtOffset(50, y - 50);
            content.showText("Grand Total: Rs. " + salesDto.getTotalAmount());
            content.endText();

            // ===================== FOOTER ======================
            content.setFont(PDType1Font.HELVETICA_OBLIQUE, 12);
            content.beginText();
            content.newLineAtOffset(50, 80);
            content.showText("Thank you for your business!");
            content.newLineAtOffset(0, -15);
            content.showText("For queries, contact support@techbridge.com");
            content.endText();

            content.close();
            document.save(file);

        } catch (Exception e) {
            e.printStackTrace();
            log.error("PDF generation failed", e);
        }

        return file;
    }


}
