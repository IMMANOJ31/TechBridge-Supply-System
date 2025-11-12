package com.techbridge.app.dto;

import com.techbridge.app.entity.ApprovalStatus;
import com.techbridge.app.enums.VoucherType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class PurchaseDto {
    private VoucherType voucherType;
    private String customerName;
    private String productGroup;
    private String make;
    private String model;
    private String productCode;
    private String itemName;
    private String openingValue;
    private String totalCost;
    private String openingBalance;
    private String purchasePrice;
    private int quantity;
    private String dueDate;
    private ApprovalStatus status;
}
