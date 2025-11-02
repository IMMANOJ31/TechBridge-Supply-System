package com.techbridge.app.entity;

import com.techbridge.app.enums.Gender;
import com.techbridge.app.enums.Role;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "registration_details")
@Data

@NamedQueries({
        @NamedQuery(name = "doesUserExist",query = "SELECT r FROM RegistrationEntity r WHERE r.email = :emailId OR r.phoneNumber = :phoneId"),
        @NamedQuery(name = "passwordExists", query = "select count(p) from RegistrationEntity p where p.password =: pass"),
        @NamedQuery(name = "mailExist",query = "SELECT r FROM RegistrationEntity r WHERE r.email = :mailId"),
        @NamedQuery(name = "phoneExist",query = "SELECT p FROM RegistrationEntity p WHERE p.phoneNumber = :phone"),
        @NamedQuery(name = "resetOtp",query = "UPDATE RegistrationEntity o set o.otp = NULL"),
        @NamedQuery(name = "saveOtp",query = "UPDATE RegistrationEntity r SET r.otp = :otp WHERE r.email = :email"),
        @NamedQuery(name = "getByRole",query = "from RegistrationEntity where role = 'USER'"),
        @NamedQuery(name = "getUserById",query = "from RegistrationEntity where id =: id"),
        @NamedQuery(name = "removeUser",query = "DELETE from RegistrationEntity where id =: id")
}
)
public class RegistrationEntity {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    private String email;
    @Column(name = "phone")
    private String phoneNumber;
    @Enumerated(EnumType.STRING)
    private Gender gender;
    @Enumerated(EnumType.STRING)
    private Role role;
    private String dob;
    private String state;
    private String city;
    private String country;
    private String password;
    private String otp;
}
