package com.techbridge.app.util;


import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class OtpNotify {

    public String otpGenerate(){
        Random random = new Random();
        int randomNumber = random.nextInt(9999);
        String otp = String.valueOf(randomNumber);
        System.out.println(otp);
        return otp;
    }
}
