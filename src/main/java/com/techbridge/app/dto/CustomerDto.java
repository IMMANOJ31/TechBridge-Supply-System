package com.techbridge.app.dto;

import com.techbridge.app.enums.CustomerType;
import com.techbridge.app.enums.PaymentMode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data @AllArgsConstructor @NoArgsConstructor
public class CustomerDto {
    private int id;

    @NotBlank(message = "Customer name can't be null")
    private String customerName;

    @NotNull(message = "Customer type can't be null")
    private CustomerType customerType;

    @NotBlank(message = "Phone number can't be null")
    @Pattern(
            regexp = "(\\+91[-\\s]?)?0?[6-9]\\d{9}",
            message = "Enter a valid phone number"
    )
    private String phoneNumber;

    @NotBlank(message = "Email can't be null")
    private String email;

    @NotBlank(message = "Gst can't be null")
    @Pattern(
            regexp = "^(0[1-9]|[12]\\d|3[0-7])[A-Za-z]{5}\\d{4}[A-Za-z][A-Za-z1-9][Zz][A-Za-z0-9]$",
            message = "Enter valid gst number"
    )
    private String gstNumber;

    @NotBlank(message = "Country can't be null")
    private String country;

    @NotBlank(message = "State can't be null")
    private String state;

    @NotBlank(message = "City can't be null")
    private String city;

    @NotBlank(message = "Pincode can't be null")
    @Pattern(
            regexp = "^[1-9]\\d{2}\\s?\\d{3}$",
            message = "Enter valid pincode"
    )
    private String pincode;

    @NotBlank(message = "Address can't be null")
    private String address;

    @NotBlank(message = "Billing address can't be null")
    private String billingAddress;

    @NotBlank(message = "Shipping address can't be null")
    private String shippingAddress;

    @NotNull(message = "Payment can't be null")
    private PaymentMode paymentMode;
}
