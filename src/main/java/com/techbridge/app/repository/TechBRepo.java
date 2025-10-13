package com.techbridge.app.repository;

import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.RegistrationEntity;

public interface TechBRepo {
    boolean saveDetails(RegistrationEntity entity);

    boolean existsEmailOrPhone(String email, String phoneNumber);
}
