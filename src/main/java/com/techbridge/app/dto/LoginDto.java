package com.techbridge.app.dto;


import com.techbridge.app.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.time.LocalTime;

@Data @NoArgsConstructor @AllArgsConstructor
public class LoginDto {

    @NotBlank(message = "Email or phone number is required")
    @Pattern(
            regexp = "^(?:[\\w.-]+@(?:[\\w-]+\\.)+[\\w-]{2,}|(?:\\+91[-\\s]?)?0?[6-9]\\d{9})$",
            message = "Enter a valid email or phone number"
    )
    private String emailOrPhone;

    private String password;

    private Role role;

    private LocalDate loggedDate;

    private LocalTime loginTime;

}
