package com.techbridge.app.restcontroller;

import com.techbridge.app.dto.AdminDto;
import com.techbridge.app.dto.LoginDto;
import com.techbridge.app.dto.UserDto;
import com.techbridge.app.service.TechBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class TechBridgeRC {

    public TechBridgeRC(){
        System.err.println("Rest controller invoked");
    }

    @Autowired
    TechBService service;

    @PostMapping("register")
    public String Register(@Valid UserDto dto, BindingResult result){
        if (result.hasErrors()){
            return "Data Error";
        }
        String s = service.profileRegister(dto);
        System.out.println(s);
        return "Successfully registered";
    }
}
