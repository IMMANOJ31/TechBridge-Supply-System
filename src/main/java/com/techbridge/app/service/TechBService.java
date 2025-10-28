package com.techbridge.app.service;

import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.RegistrationDto;

public interface TechBService {
    String profileRegister(RegistrationDto dto);

    String  doesUserExist(String emailPhone, String inputPassword);

    LoginDto passwordExist(LoginDto dto,String inputPassword);

    String otpSending(String email);

    RegistrationDto mailExist(String email);

    RegistrationDto mailNPhoneExist(String email,String phoneNumber);

    String verifyOtp(String email, String otp);

    String passwordUpdate(String email, String password);

    String saveLoginDetails(LoginDto dto);
}
