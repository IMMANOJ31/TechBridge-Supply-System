package com.techbridge.app.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "products")
@Data @AllArgsConstructor @NoArgsConstructor

@NamedQueries({
        @NamedQuery(name = "fetchProduct",query = "select p.productGroup from ProductEntity p"),
        @NamedQuery(name = "fetchingAllProducts", query = "from ProductEntity ")
})
public class ProductEntity {

    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(nullable = false, unique = true)
    private String productGroup;
}
