package com.techbridge.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesDto {
    private int id;
    private String customerName;
    private String productName;
    private String brand;
    private String model;
    private String sellingPrice;
    private String quantity;
    private String totalAmount;
    private String salesDate;
}
