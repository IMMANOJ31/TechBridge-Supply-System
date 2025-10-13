package com.techbridge.app.repository;

import com.techbridge.app.entity.AdminEntity;
import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.UserEntity;

public interface TechBRepo {
    String saveDetails(UserEntity entity);
}
