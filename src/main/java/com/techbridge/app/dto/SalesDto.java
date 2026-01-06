package com.techbridge.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesDto {
    private int id;

    @NotBlank(message = "Customer name is required")
    @Size(min = 2, max = 50, message = "Customer name must be between 2 and 50 characters")
    private String customerName;

    @NotBlank(message = "Product name is required")
    @Size(min = 2, max = 50, message = "Product name must be between 2 and 50 characters")
    private String productName;

    @NotBlank(message = "Brand is required")
    @Size(min = 2, max = 30, message = "Brand name must be between 2 and 30 characters")
    private String brand;

    @NotBlank(message = "Model is required")
    @Size(min = 1, max = 30, message = "Model must be between 1 and 30 characters")
    private String model;

    @NotBlank(message = "Selling price is required")
    @Pattern(
            regexp = "^\\d+(\\.\\d{1,2})?$",
            message = "Amount must be a valid number"
    )

    private String sellingPrice;

    @NotBlank(message = "Quantity is required")
    @Pattern(
            regexp = "^[1-9]\\d*$",
            message = "Quantity must be a positive integer"
    )

    private String quantity;

    @NotBlank(message = "Total amount is required")
    @Pattern(
            regexp = "^\\d+(\\.\\d{1,2})?$",
            message = "Amount must be a valid number"
    )

    private String totalAmount;

    @NotBlank(message = "Sales date is required")
    @Pattern(
            regexp = "^\\d{4}-\\d{2}-\\d{2}$",
            message = "Sales date must be in YYYY-MM-DD format"
    )

    private String salesDate;
}
