package com.techbridge.app.util;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


@Component
@Slf4j
public class MailNotify {

    private JavaMailSender mailSender;
    private OtpNotify otpNotify;

    private static final String MAIL_SENT_SUCCESSFULLY = "Mail sent successfully";

    private static final String MAIL_ID = "manoj65293@gmail.com";


    public MailNotify(JavaMailSender mailSender,OtpNotify otpNotify){
        this.otpNotify = otpNotify;
        this.mailSender = mailSender;
    }

    public String sendRegisterationMail(String email){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(MAIL_ID);
        message.setTo(email);
        message.setSubject("Thank You for Registering with TechBridge!");
        message.setText(
                "Dear User,\n\n" +
                        "Thank you for registering with TechBridge! 🎉\n\n" +
                        "Your account has been successfully created, and you can now log in to explore all our services and features.\n\n" +
                        "If you have any questions or need assistance, feel free to contact our support team at support@techbridge.com.\n\n" +
                        "Warm regards,\n" +
                        "The TechBridge Team\n" +
                        "www.techbridge.com"
        );
        mailSender.send(message);
        return MAIL_SENT_SUCCESSFULLY;
    }

    public String sendLoginNotification(String email) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(MAIL_ID);
        message.setTo(email);
        message.setSubject("\uD83D\uDD10 Login Successful - TechBridge Account Notification");
        message.setText(
                "Dear User,\n\n" +
                        "You have successfully logged in to your TechBridge account. ✅\n\n" +
                        "If this login was done by you, no further action is required.\n" +
                        "If you did **not** perform this login, please change your password immediately.\n\n" +
                        "📅 Login Time: " + java.time.LocalDateTime.now() + "\n" +
                        "📍 Location: [Your Device/IP]\n\n" +
                        "Stay secure and thank you for using TechBridge!\n\n" +
                        "Warm regards,\n" +
                        "The TechBridge Team\n" +
                        "support@techbridge.com\n" +
                        "www.techbridge.com"
        );

        mailSender.send(message);
        log.info("Login notification sent to: {}", email);

        return MAIL_SENT_SUCCESSFULLY;
    }


    public String sendOtpMail(String email){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(MAIL_ID);
        message.setTo(email);
        message.setSubject("\uD83D\uDD11 Password Reset OTP - TechBridge");
        message.setText(
                "Dear User,\n\n" +
                        "We received a request to reset your password for your TechBridge account.\n\n" +
                        "Your One-Time Password (OTP) for password reset is:\n\n" +
                        "👉  OTP: " + otpNotify.otpGenerate() + "\n\n" +
                        "⚠️ Please note: This OTP is valid for the next 10 minutes only.\n" +
                        "Do NOT share this OTP with anyone for your account’s safety.\n\n" +
                        "If you did not request a password reset, please ignore this email.\n\n" +
                        "Stay secure,\n" +
                        "The TechBridge Team\n" +
                        "support@techbridge.com\n" +
                        "www.techbridge.com"
        );
        mailSender.send(message);
        log.info(" Password reset OTP mail sent to: " + email);
        return MAIL_SENT_SUCCESSFULLY;
    }

    public String sendSalesConfirmationMail(String email,String customerName){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(MAIL_ID);
        message.setTo(email);
        message.setSubject("Sales Order Confirmation – TechBridge");

        String mailBody =
                "Dear " + customerName + ",\n\n" +
                        "Thank you for your purchase from TechBridge.\n\n" +
                        "We are pleased to inform you that your sales order" +
                        "has been successfully processed and recorded in our system.\n\n" +
                        "Our team is preparing your items for dispatch as per the standard processing timeline. " +
                        "You will receive further updates once the shipment is scheduled.\n\n" +
                        "If you have any questions or require assistance, please feel free to contact our support team at support@techbridge.com.\n\n" +
                        "Warm regards,\n" +
                        "TechBridge Sales Team\n" +
                        "www.techbridge.com";

        message.setText(mailBody);
        mailSender.send(message);
        return MAIL_SENT_SUCCESSFULLY;
    }
}
