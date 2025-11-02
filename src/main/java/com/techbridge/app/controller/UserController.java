package com.techbridge.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class UserController {

    @GetMapping("/salesPage")
    public String salesPage() {
        return "salesPage";
    }

    @GetMapping("/purchasePage")
    public String purchasePage() {
        return "purchasePage";
    }

}
