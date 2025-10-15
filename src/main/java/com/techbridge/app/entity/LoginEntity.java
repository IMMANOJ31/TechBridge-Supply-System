package com.techbridge.app.entity;

import com.techbridge.app.enums.Gender;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "login_details")
@Data

public class LoginEntity{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "email_or_phone")
    private String emailOrPhone;
    private String password;
}
