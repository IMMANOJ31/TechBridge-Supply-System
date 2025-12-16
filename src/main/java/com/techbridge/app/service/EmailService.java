package com.techbridge.app.service;

public interface EmailService {
    void sendInvoice(String toEmail, byte[] pdf, String fileName);
}
