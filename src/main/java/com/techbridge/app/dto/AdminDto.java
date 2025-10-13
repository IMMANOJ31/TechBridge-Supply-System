package com.techbridge.app.dto;

import com.techbridge.app.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

@Data @NoArgsConstructor @AllArgsConstructor
public class AdminDto {
    @NotBlank(message = "first name can't be null")
    private String firstName;
    @NotBlank(message = "last name can't be null")
    private String lastName;
    @NotBlank(message = "email can't be null")
    private String email;
    @NotBlank(message = "enter the password")
    private String password;
    private Role role;
}
