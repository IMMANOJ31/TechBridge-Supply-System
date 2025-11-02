package com.techbridge.app.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class SalesDto {
    private int id;
    private String voucherType;
    private String CustomerName;
    private String ProductGroup;
    private String make;
    private String model;
    private String productCode;
    private String itemName;
    private String openingValue;
    private String openingBalance;
    private String purchasePrice;
    private String dueDate;
}
