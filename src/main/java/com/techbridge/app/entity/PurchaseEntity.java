package com.techbridge.app.entity;

import com.techbridge.app.enums.ApprovalStatus;
import com.techbridge.app.enums.VoucherType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "purchase_details")

@NamedQueries({
        @NamedQuery(name = "fetchPurchase",query = "from PurchaseEntity"),
        @NamedQuery(name = "approval", query = "SELECT p FROM PurchaseEntity p WHERE p.status = :status")

})
public class PurchaseEntity {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Enumerated(EnumType.STRING)
    private VoucherType voucherType;
    @Column(name = "customer_name")
    private String customerName;
    @Column(name = "product_group")
    private String productGroup;
    private String make;
    private String model;
    @Column(name = "product_code")
    private String productCode;
    @Column(name = "item_name")
    private String itemName;
    @Column(name = "total_cost")
    private String totalCost;
    @Column(name = "purchase_price")
    private String purchasePrice;
    private int quantity;
    @Column(name = "due_date")
    private String dueDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ApprovalStatus status = ApprovalStatus.PENDING;
}
