package com.techbridge.app.api;


import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class RedirectPage {

    public RedirectPage(){
        System.err.println("Redirect pages");
    }

    @GetMapping("registration")
    public String createProfile(){
        return "registerPage";
    }

    @GetMapping("forgotPassword")
    public String forgetPassword(){
        return "forgotPasswordPage";
    }

}
