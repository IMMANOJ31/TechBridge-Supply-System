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
    @Pattern(
            regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{6,}$",
            message = "Password must contain at least 1 uppercase, 1 lowercase, 1 digit, and be 6+ characters long"
    )
    private String password;
    @NotBlank(message = "Password can't be null")
    private String confirmPassword;
    private Role role;
}
