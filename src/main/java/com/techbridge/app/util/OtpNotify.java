package com.techbridge.app.util;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
@Slf4j
public class OtpNotify {

    public String otpGenerate(){
        Random random = new Random();
        int randomNumber = random.nextInt(9999);
        String otp = String.valueOf(randomNumber);
        log.info("Otp---------> {}",otp);
        return otp;
    }
}
