package com.techbridge.app.entity;

import com.techbridge.app.enums.CustomerType;
import com.techbridge.app.enums.PaymentMode;
import lombok.Data;

import javax.persistence.*;

@Data
@Table(name = "customer_details")
@Entity

@NamedQueries({
        @NamedQuery(name = "getAllCustomers",query = "from CustomerEntity")
})
public class CustomerEntity {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "customer_name")
    private String customerName;
    @Enumerated(EnumType.STRING)
    @Column(name = "customer_type")
    private CustomerType customerType;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "gst_number")
    private String gstNumber;
    private String country;
    private String email;
    private String state;
    private String city;
    private String pincode;
    private String address;
    @Column(name = "billing_address")
    private String billingAddress;
    @Column(name = "shipping_address")
    private String shippingAddress;
    @Enumerated(EnumType.STRING)
    @Column(name = "payment_mode")
    private PaymentMode paymentMode;
}
