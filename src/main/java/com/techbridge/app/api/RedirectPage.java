package com.techbridge.app.api;


import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

    @PostMapping("forgotPassword")
    public String forgetPassword(){
        return "forgotPasswordPage";
    }

    @GetMapping("index")
    public String showHomePage() {
        return "index";
    }

    @GetMapping("login")
    public String showLoginForm() {
        return "login";
    }

    @GetMapping("forgotPassword")
    public String showPasswordPage(){
        return "forgotPasswordPage";
    }

    @GetMapping("adminPage")
    public String adminPage() {
        return "adminPage";
    }




}
