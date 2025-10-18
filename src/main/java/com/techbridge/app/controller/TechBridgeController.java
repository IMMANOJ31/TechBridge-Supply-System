package com.techbridge.app.controller;

import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.RegistrationDto;
import com.techbridge.app.enums.Role;
import com.techbridge.app.service.TechBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class TechBridgeController {

    public TechBridgeController(){
        System.err.println("Controller invoked");
    }

    @Autowired
    TechBService service;

    @GetMapping("index")
    public String showHomePage() {
        return "index";
    }

    @PostMapping("register")
    public ResponseEntity<String> Register(@Valid RegistrationDto dto, BindingResult result){
        System.err.println(dto);
        if (result.hasErrors()){
            return ResponseEntity.badRequest().body("Validation failed" + result.getAllErrors());
        }
        String data = service.profileRegister(dto);
        System.err.println(data);
        switch (data){
            case "User already exists":
                return ResponseEntity.status(HttpStatus.CONFLICT).body(data);
            case "User registered successfully":
                return ResponseEntity.ok(data);
            default:
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(data);
        }
    }

    @PostMapping("loginPage")
    public String showLoginPage(@ModelAttribute LoginDto dto,Model model) {
        System.out.println("Login password  " + dto.getPassword());
        System.out.println(dto);
        String validUser = service.doesUserExist(dto.getEmailOrPhone(), dto.getPassword());
        switch (validUser) {
            case "no data found":
            case "User not found":
                model.addAttribute("error", "Invalid credentials");
                return "login";
            case "Invalid password":
                model.addAttribute("error", "Incorrect password");
                return "login";
            case "Valid user":
                return decideLoginPage(dto);
            default:
                model.addAttribute("error", "Unexpected error");
                return "login";
        }
    }

    private String decideLoginPage(LoginDto dto) {
        System.out.println("Logged by------------ "+dto);
        if (dto == null) {
            return "no data found";
        }
        if (dto.getEmailOrPhone().equals(Role.ADMIN)) {
            return "adminPage";
        }
        return "userPage";
    }

    @PostMapping("sendOtp")
    public String sendOtp(String email, Model model){
        service.otpSending(email);
        model.addAttribute("inputEmail",email);
        return "forgotPasswordPage";
    }
}
