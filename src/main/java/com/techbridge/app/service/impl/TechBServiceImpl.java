package com.techbridge.app.service.impl;

import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.entity.RegistrationEntity;
import com.techbridge.app.repository.TechBRepo;
import com.techbridge.app.service.TechBService;
//import com.techbridge.app.util.MailNotify;
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

//    @Autowired
//    MailNotify send;

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

        return loginDetails(dto,inputPassword);
    }

    @Override
    public LoginDto passwordExist(LoginDto dto, String inputPassword) {
        if (dto == null) return null;
        boolean matches = encoder.matches(inputPassword, dto.getPassword());
        return matches ? dto : null;
    }
    private String loginDetails(LoginDto dto,String inputPassword){
        System.out.println("TechBServiceImpl.loginDetails");
        if (dto == null){
            return "no data found";
        }
        boolean matches = encoder.matches(dto.getPassword(), inputPassword);
        System.out.println(matches);

        if (!encoder.matches(inputPassword,dto.getPassword())){
            return "Invalid password";
        }
        LoginDto loginDto = passwordExist(dto, inputPassword);
        LoginEntity entity = new LoginEntity();
        BeanUtils.copyProperties(loginDto,entity);
        boolean b = repo.saveLoginDetails(entity);
//        String loginMail = send.LoginMail(dto.getEmailOrPhone());
//        System.out.println(loginMail);
        return b ? "all good" : "not saved";
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
//                    String otp = otpNotify.otpGenerate();
//                    dto.setOtp(otp);
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
    public String verifyOtp(String email, String otp) {
        return "";
    }


}
