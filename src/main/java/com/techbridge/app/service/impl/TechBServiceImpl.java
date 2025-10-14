package com.techbridge.app.service.impl;

import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.repository.TechBRepo;
import com.techbridge.app.service.TechBService;
//import com.techbridge.app.util.UserNotify;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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

//    @Autowired
//    UserNotify send;

    @Override
    public String  profileRegister(RegistrationDto dto) {
        if (!dto.getPassword().equals(dto.getConfirmPassword())) return "password mismatch";
        if (dto == null) {
            return "no data found";
        }
        boolean exist = repo.existsEmailOrPhone(dto.getEmail(), dto.getPhoneNumber());
        if (exist) {
            return "User already exists";
        }
        dto.setPassword(encoder.encode(dto.getPassword()));
        RegistrationEntity entity = new RegistrationEntity();
        BeanUtils.copyProperties(dto, entity);
        System.err.println(entity);
        boolean isSaved = repo.saveDetails(entity);
        if (isSaved) {
//            send.registerMail(dto.getEmail());
            return "User registered successfully";
        } else return "Something went wrong!!!!!!!";
    }

    @Override
    public String doesUserExist(String emailPhone, String inputPassword) {
        if (emailPhone == null && inputPassword == null ){
            return "Data base error";
        }
        boolean b = repo.existsEmailOrPhone(emailPhone, inputPassword);
        System.out.println("Email and password exist "+b);
        return "false";

    }
}
