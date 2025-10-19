package com.techbridge.app.repository;

import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.RegistrationEntity;

public interface TechBRepo {
    boolean saveDetails(RegistrationEntity entity);

    RegistrationEntity existsEmailOrPhone(String email, String phoneNumber);

    boolean existsPassword(String password);

    RegistrationEntity checkMailExist(String email);

    boolean saveLoginDetails(LoginEntity entity);
}
