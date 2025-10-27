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
    @NotBlank(message = "Customer name can't be null")
    private String customerName;
    @NotBlank(message = "Customer type can't be null")
    private CustomerType customerType;
    @NotBlank(message = "Phone number can't be null")
    @Pattern(
            regexp = "(\\+91[-\\s]?)?[0]?[6-9]\\d{9}",
            message = "Enter a valid phone number"
    )
    private String phoneNumber;
    @NotBlank(message = "Gst can't be null")
    @Pattern(
            regexp = "^([0][1-9]|[1-2][0-9]|[3][0-7])([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$\n",
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
            regexp = "^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}$",
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
