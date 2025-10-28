package com.techbridge.app.dto;

import com.techbridge.app.enums.Gender;
import com.techbridge.app.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

@Data  @AllArgsConstructor
public class RegistrationDto {

    public RegistrationDto(){
        System.out.println("Dto invoked");
    }

    private int id;

    @NotBlank(message = "First name can't be null")
    private String firstName;

    @NotBlank(message = "Last name can't be null")
    private String lastName;

    @NotBlank(message = "Enter a valid email")
    private String email;

    @NotBlank(message = "Phone number can't be null")
    @Pattern(
            regexp = "(\\+91[-\\s]?)?[0]?[6-9]\\d{9}",
            message = "Enter a valid phone number"
    )
    private String phoneNumber;

    @NotNull(message = "Mention your gender")
    private Gender gender;

    @NotNull(message = "Date of birth must be in the past")
    private String dob;

    @NotBlank(message = "State can't be null")
    private String state;

    private Role role;

    @NotBlank(message = "City can't be null")
    private String city;

    @NotBlank(message = "Country can't be null")
    private String country;

    @Pattern(
            regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{6,}$",
            message = "Password must contain at least 1 uppercase, 1 lowercase, 1 digit, and be 6+ characters long"
    )
    private String password;

    private String ConfirmPassword;

    private String otp;

}
