package com.techbridge.app.entity;

import com.techbridge.app.enums.Gender;
import com.techbridge.app.enums.Role;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "login_details")
@Data

public class LoginEntity{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "email_or_phone")
    private String emailOrPhone;

    private Role role;

    @Column(name = "login_date")
    private LocalDate loginDate;

    @Column(name = "login_time")
    private LocalTime loginTime;
}
