package com.techbridge.app.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "sales_list")
@Data
public class SalesEntity {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "customer_name")
    private String customerName;
    @Column(name = "product_name")
    private String productName;
    private String brand;
    private String model;
    @Column(name = "selling_price")
    private String sellingPrice;
    private String quantity;
    @Column(name = "total_amount")
    private String totalAmount;
    @Column(name = "sales_date")
    private String salesDate;
    private String email;
}
