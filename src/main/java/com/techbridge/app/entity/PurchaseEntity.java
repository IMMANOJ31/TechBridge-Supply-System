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
        @NamedQuery(name = "approval", query = "SELECT p FROM PurchaseEntity p WHERE p.status = :status"),
        @NamedQuery(name = "findById", query = "Select r from PurchaseEntity r where r.id = :id"),
        @NamedQuery(name = "pendingOrder",query = "Select p from PurchaseEntity p where p.status = 'PENDING'"),
        @NamedQuery(name = "approved",query = "Update PurchaseEntity p set p.status = 'APPROVED' where p.id =: id"),
        @NamedQuery(name = "rejected",query = "Update PurchaseEntity p set p.status = 'REJECTED' where p.id =: id"),
        @NamedQuery(name = "findByStatus",query = "SELECT p FROM PurchaseEntity p WHERE p.status = :status"),
        @NamedQuery(name = "byProductCode",query = "SELECT p FROM PurchaseEntity p WHERE p.productCode =: proCode")
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
    private Integer totalCost;
    @Column(name = "purchase_price")
    private Integer purchasePrice;
    private Integer quantity;
    @Column(name = "due_date")
    private String dueDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ApprovalStatus status = ApprovalStatus.PENDING;
}
