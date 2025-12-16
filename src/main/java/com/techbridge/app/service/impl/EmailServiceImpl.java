package com.techbridge.app.service.impl;

import com.techbridge.app.service.EmailService;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {

    private JavaMailSender mailSender;

    public EmailServiceImpl(JavaMailSender mailSender){
        this.mailSender = mailSender;
    }
    @Override
    public void sendInvoice(String toEmail, byte[] pdf, String fileName) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(toEmail);
            helper.setSubject("Your Purchase Invoice");
            helper.setText("Dear Customer,\n\nPlease find your invoice attached.");

            helper.addAttachment(fileName,new ByteArrayResource(pdf));

            mailSender.send(message);

        } catch (Exception e) {
            throw new RuntimeException("Email sending failed", e);
        }
    }
}
