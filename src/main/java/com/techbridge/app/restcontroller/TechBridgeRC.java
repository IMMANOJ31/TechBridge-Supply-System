package com.techbridge.app.restcontroller;

import com.techbridge.app.dto.UserDto;
import com.techbridge.app.service.TechBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class TechBridgeRC {

    public TechBridgeRC(){
        System.err.println("Rest controller invoked");
    }

    @Autowired
    TechBService service;

    @PostMapping("register")
    public String Register(UserDto dto, BindingResult result){
        if (result.hasErrors()){
            return "Data Error";
        }
        service.profileRegister(dto);
        return "Successfully registered";
    }
}
