package com.techbridge.app.util;

import java.util.Random;

public class OtpNotify {

    public String otpGenerate(){
        Random random = new Random();
        int randomNumber = random.nextInt(9999);
        String otp = String.valueOf(randomNumber);
        System.out.println(otp);
        return "Otp generated!!";
    }
}
