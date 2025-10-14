//package com.techbridge.app.util;
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Component;
//
//
//@Component
//public class UserNotify {
//
//    @Autowired
//    JavaMailSender mailSender;
//
//    public String registerMail(String email){
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setFrom("manoj65293@gmail.com");
//        message.setTo(email);
//        message.setSubject("Thank You for Registering with TechBridge!");
//        message.setText(
//                "Dear User,\n\n" +
//                        "Thank you for registering with TechBridge! 🎉\n\n" +
//                        "Your account has been successfully created, and you can now log in to explore all our services and features.\n\n" +
//                        "If you have any questions or need assistance, feel free to contact our support team at support@techbridge.com.\n\n" +
//                        "Warm regards,\n" +
//                        "The TechBridge Team\n" +
//                        "www.techbridge.com"
//        );
//        mailSender.send(message);
//        return "Mail sent successfully";
//    }
//}
