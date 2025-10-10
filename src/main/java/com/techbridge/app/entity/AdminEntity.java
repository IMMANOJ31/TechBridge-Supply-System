package com.techbridge.app.entity;

import com.techbridge.app.enums.Role;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "admin_details")
@Data
public class AdminEntity {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    private String email;
    private String password;
    private Role role;
}
