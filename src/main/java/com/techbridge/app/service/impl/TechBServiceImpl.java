package com.techbridge.app.service.impl;

import com.techbridge.app.dto.UserDto;
import com.techbridge.app.repository.TechBRepo;
import com.techbridge.app.service.TechBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TechBServiceImpl implements TechBService {

    @Autowired
    TechBRepo repo;

    @Override
    public String  profileRegister(UserDto dto) {
        return "(Repo) --> profile registered ";
    }
}
