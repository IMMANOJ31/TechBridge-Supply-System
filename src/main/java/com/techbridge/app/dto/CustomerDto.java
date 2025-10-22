package com.techbridge.app.dto;

import com.techbridge.app.enums.CustomerType;
import com.techbridge.app.enums.PaymentMode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class CustomerDto {
    private int id;
    private String customerName;
    private CustomerType customerType;
    private String phoneNumber;
    private String gstNumber;
    private String country;
    private String state;
    private String city;
    private String pincode;
    private String address;
    private String billingAddress;
    private String shippingAddress;
    private PaymentMode paymentMode;
}
