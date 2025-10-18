package com.techbridge.app.service.impl;

import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.repository.TechBRepo;
import com.techbridge.app.service.TechBService;
import com.techbridge.app.util.MailNotify;
import com.techbridge.app.util.OtpNotify;
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

    @Autowired
    MailNotify send;

    @Autowired
    OtpNotify otpNotify;

    @Override
    public String  profileRegister(RegistrationDto dto) {
        if (!dto.getPassword().equals(dto.getConfirmPassword())) return "password mismatch";
        if (dto == null) {
            return "no data found";
        }
        RegistrationEntity exist = repo.existsEmailOrPhone(dto.getEmail(), dto.getPhoneNumber());
        if (exist != null) {
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
        if (emailPhone == null || inputPassword == null ){
            return "no data found";
        }
        RegistrationEntity entity = repo.existsEmailOrPhone(emailPhone,inputPassword);
        if (entity == null) {
            return "User not found";
        }

        LoginDto dto = new LoginDto();
        dto.setEmailOrPhone(entity.getEmail());
        dto.setPassword(entity.getPassword());

        String passwordStatus = passwordExist(dto, inputPassword);
        if (passwordStatus.equals("password doesn't exist")) {
            return "Invalid password";
        }

        return "Valid user";
    }

    @Override
    public String passwordExist(LoginDto dto, String inputPassword) {
        if (dto == null) return "database issue";
        boolean matches = encoder.matches(inputPassword, dto.getPassword());
        return matches ? "password" : "password doesn't exist";
    }

    @Override
    public String otpSending(String email) {
        if (email == null){
            return "no data found";
        }
        if (email.contains("@") && email.contains(".com")){
            RegistrationDto dto = mailExist(email);
            if (dto != null){
                if (dto.getEmail().equals(email)){
                    String otp = otpNotify.otpGenerate();
                    dto.setOtp(otp);
                    RegistrationEntity entity = new RegistrationEntity();
                    BeanUtils.copyProperties(dto,entity);
                }
            }

        }
        return "allGood";
    }

    @Override
    public RegistrationDto mailExist(String email) {
        RegistrationEntity entity = repo.checkMailExist(email);
        if (entity == null){
            System.out.println("email = " + email);
            return null;
        }else {
            RegistrationDto dto = new RegistrationDto();
            BeanUtils.copyProperties(entity, dto);
            System.out.println("TechBServiceImpl.mailExist");
            return dto;
        }
    }


}
