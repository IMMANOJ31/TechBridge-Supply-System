package com.techbridge.app.dto;

import com.techbridge.app.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class AdminDto {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private Role role;
    private String sumne;
}
