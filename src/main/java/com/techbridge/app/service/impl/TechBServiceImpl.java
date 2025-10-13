package com.techbridge.app.service.impl;

import com.techbridge.app.dto.AdminDto;
import com.techbridge.app.dto.UserDto;
import com.techbridge.app.entity.AdminEntity;
import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.UserEntity;
import com.techbridge.app.repository.TechBRepo;
import com.techbridge.app.service.TechBService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class TechBServiceImpl implements TechBService {

    public TechBServiceImpl(){
        System.err.println("Service invoked!!!!!!");
    }
    @Autowired
    TechBRepo repo;

    @Autowired
    BCryptPasswordEncoder encoder;

    @Override
    public String  profileRegister(UserDto dto) {
        if (!dto.getPassword().equals(dto.getConfirmPassword())){
            return "Password Mismatch";
        }else {
            dto.setPassword(encoder.encode(dto.getPassword()));
            UserEntity entity = new UserEntity();
            BeanUtils.copyProperties(dto,entity);
            return repo.saveDetails(entity);
        }
    }
}
