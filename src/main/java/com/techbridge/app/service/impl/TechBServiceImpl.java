package com.techbridge.app.service.impl;

import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.LoginEntity;
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
        System.out.println("Service invoked!!!!!!");
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
        RegistrationEntity entity = repo.checkMailExist(emailPhone);

        if (entity == null) {
            entity = repo.checkPhoneExist(emailPhone);
        }if (entity == null){
            return "User not found";
        }

        if (!encoder.matches(inputPassword,entity.getPassword())){
            return "Invalid password";
        }
        return entity.getRole().name();
    }

    @Override
    public LoginDto passwordExist(LoginDto dto, String inputPassword) {
        if (dto == null) return null;
        boolean matches = encoder.matches(inputPassword, dto.getPassword());
        return matches ? dto : null;
    }
    private String loginDetails(LoginDto dto, String inputPassword) {
        System.out.println("TechBServiceImpl.loginDetails");

        if (dto == null) {
            return "no data found";
        }

        if (!encoder.matches(inputPassword, dto.getPassword())) {
            return "Invalid password";
        }
        LoginEntity entity = new LoginEntity();
        BeanUtils.copyProperties(dto, entity);
        boolean saved = repo.saveLoginDetails(entity);
        // send.LoginMail(dto.getEmailOrPhone());
        return saved ? "all good" : "not saved";
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
        return "allGood in sending otp";
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

    @Override
    public RegistrationDto mailNPhoneExist(String email, String phoneNumber) {
        RegistrationEntity entity = repo.existsEmailOrPhone(email, phoneNumber);
        if (entity == null){
            return null;
        }else {
            RegistrationDto dto = new RegistrationDto();
            BeanUtils.copyProperties(entity,dto);
            System.out.println("email = " + email + ", phoneNumber = " + phoneNumber);
            return dto;
        }
    }

    @Override
    public String verifyOtp(String email, String otp) {
        RegistrationDto dto = mailExist(email);
        System.out.println(otp);
        System.out.println(dto.toString());
        if (email == null){
            return "no data found";
        }
        if (!otp.equals(dto.getOtp())){
            return "missMatch";
        }
        return "otp verified";
    }

    @Override
    public String passwordUpdate(String email, String password) {
        if (email == null){
            return "no data found";
        }
        RegistrationDto dto = mailExist(email);
        dto.setPassword(encoder.encode(password));
        RegistrationEntity entity = new RegistrationEntity();
        BeanUtils.copyProperties(dto,entity);
        boolean b = repo.passwordUpdate(entity);
        System.out.println(b);
        return "password updated";
    }


}
