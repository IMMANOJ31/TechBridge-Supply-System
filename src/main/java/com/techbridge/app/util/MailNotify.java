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

    public MailNotify(JavaMailSender mailSender,OtpNotify otpNotify){
        this.otpNotify = otpNotify;
        this.mailSender = mailSender;
    }

    public String registerMail(String email){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("manoj65293@gmail.com");
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
        return "Mail sent successfully";
    }

    public String LoginMail(String email){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("manoj65293@gmail.com");
        message.setTo(email);
        message.setSubject("\uD83D\uDD10 Login Successful - TechBridge Account Notification");
        message.setText(
                "Dear User,\n\n" +
                        "You have successfully logged in to your TechBridge account. ✅\n\n" +
                        "If this login was done by you, no further action is required.\n" +
                        "If you did **not** perform this login, we recommend changing your password immediately for security reasons.\n\n" +
                        "📅 Login Time: " + java.time.LocalDateTime.now() + "\n" +
                        "📍 Location: [Your Device/IP]\n\n" +
                        "Stay secure and thank you for using TechBridge!\n\n" +
                        "Warm regards,\n" +
                        "The TechBridge Team\n" +
                        "support@techbridge.com\n" +
                        "www.techbridge.com"
        );
        mailSender.send(message);
        log.info("Login notification sent to: " + email);
        return "Mail sent successfully";
    }

    public String OtpMail(String email){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("manoj65293@gmail.com");
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
        return "Mail sent successfully";
    }
}
