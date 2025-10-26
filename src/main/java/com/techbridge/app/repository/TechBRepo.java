package com.techbridge.app.repository;

import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.RegistrationEntity;

public interface TechBRepo {
    boolean saveDetails(RegistrationEntity entity);

    RegistrationEntity existsEmailOrPhone(String email, String phoneNumber);

    boolean existsPassword(String password);

    RegistrationEntity checkMailExist(String email);

    RegistrationEntity checkPhoneExist(String phoneNumber);

    boolean saveLoginDetails(LoginEntity entity);

    boolean passwordUpdate(RegistrationEntity entity);

    void clearOtp();

    boolean saveOtp(String email, String otp);
}
