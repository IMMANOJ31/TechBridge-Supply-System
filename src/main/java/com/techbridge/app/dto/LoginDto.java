package com.techbridge.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

@Data @NoArgsConstructor @AllArgsConstructor
public class LoginDto {

    @NotBlank(message = "Email or phone number is required")
    @Pattern(
            regexp = "^(?:[\\w\\-.]+@([\\w-]+\\.)+[\\w-]{2,}|(\\+91[-\\s]?)?[0]?[6-9]\\d{9})$",
            message = "Enter a valid email or phone number"
    )
    private String emailOrPhone;

    @NotBlank(message = "Password is required")
    private String password;
}
