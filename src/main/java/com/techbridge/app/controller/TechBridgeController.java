package com.techbridge.app.controller;

import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.entity.LoginEntity;
import com.techbridge.app.enums.Role;
import com.techbridge.app.service.TechBService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@Slf4j
@RequestMapping("/")
public class TechBridgeController {

    private TechBService service;

    public TechBridgeController(TechBService service){
        this.service = service;
        System.err.println("Controller invoked");
    }


    @GetMapping("register")
    public String showAccountPage(Model model)
    { model.addAttribute("registrationDto",new RegistrationDto());
        return "addUserPage";
    }

    @PostMapping("register")
    public ResponseEntity<String> Register(@Valid RegistrationDto dto, BindingResult result){
        log.info("Register info: {}",dto);
        if (result.hasErrors()){
            return ResponseEntity.badRequest().body("Validation failed" + result.getAllErrors());
        }
        String data = service.profileRegister(dto);
        log.info("Registered data: {}",data);
        switch (data){
            case "User already exists":
                return ResponseEntity.status(HttpStatus.CONFLICT).body(data);
            case "User registered successfully":
                return ResponseEntity.ok(data);
            default:
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(data);
        }
    }

    @PostMapping("login")
    @ResponseBody
    public ResponseEntity<?> showLoginPage(@ModelAttribute LoginDto dto, Model model, HttpSession session) {
        log.info("Login password: {}",dto.getPassword());
        log.info("Login page: {}",dto);
        String input = dto.getEmailOrPhone().trim();

        String validUser = service.doesUserExist(input, dto.getPassword().trim());
        switch (validUser) {
            case "no data found":
            case "User not found":
                model.addAttribute("error", "Invalid credentials");
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User does not exist");
            case "Invalid password":
                model.addAttribute("error", "Incorrect password");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid password");
            case "ADMIN":
                session.setAttribute("loggedInUser",dto);
                service.saveLoginDetails(dto);
                return ResponseEntity.ok("ADMIN");
            case "USER":
                session.setAttribute("loggedInUser",dto);
                service.saveLoginDetails(dto);
                return ResponseEntity.ok("USER");
            default:
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Unexpected error");
        }

    }

    private String decideLoginPage(RegistrationDto registrationDto,LoginDto dto) {
        log.info("decide login page: {}",registrationDto);
        LoginEntity entity = new LoginEntity();
        entity.setRole(dto.getRole());
        log.info("Logged by: {}",dto);
        if (dto == null) {
            return "no data found";
        }
        if (registrationDto.getRole() == Role.ADMIN) {
            return "adminPage";
        }
        return "userPage";
    }

    @PostMapping("sendOtp")
    public String sendOtp(@RequestParam  String email, Model model){
        service.otpSending(email);
        model.addAttribute("inputEmail",email);
        return "forgotPasswordPage";
    }

    @PostMapping("verifyOtp")
    public String otpVerification(@RequestParam String email, String otp, Model model){
        String verifiedOtp = service.verifyOtp(email, otp);
        log.info("Verified otp: {}",verifiedOtp);
         model.addAttribute("otp",otp);
        if (verifiedOtp.equals("invalidOtp")){
            return "forgotPasswordPage";
        }else if (verifiedOtp.equals("missMatch")){
            model.addAttribute("otpError", "Invalid OTP. Try again");
            model.addAttribute("inputEmail", email);
            return "forgotPasswordPage";
        }
        model.addAttribute("inputEmail",email);
        return "resetPassword";
    }

    @PostMapping("updatePass")
    public String passworReset(@RequestParam String email, @RequestParam String password,Model model){
        service.passwordUpdate(email,password);
        model.addAttribute("msg","Password reseted successfully");
        return "login";
    }
}
