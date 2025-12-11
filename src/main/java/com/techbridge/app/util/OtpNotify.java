package com.techbridge.app.util;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.security.SecureRandom;
import java.util.Random;

@Component
@Slf4j
public class OtpNotify {

    private static final SecureRandom SECURE_RANDOM = new SecureRandom();


    public String otpGenerate() {
        int randomNumber = SECURE_RANDOM.nextInt(10000);
        String otp = String.format("%04d", randomNumber);
        log.info("Generated OTP: {}", otp);
        return otp;
    }

}
