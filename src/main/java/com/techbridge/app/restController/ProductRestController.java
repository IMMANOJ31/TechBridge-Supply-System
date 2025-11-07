package com.techbridge.app.restController;

import com.techbridge.app.dto.ProductDto;
import com.techbridge.app.entity.ProductEntity;
import com.techbridge.app.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductRestController {

    private final ProductService productService;

    public ProductRestController(ProductService productService){
        this.productService = productService;
    }

    @PostMapping
    public ProductEntity addProduct(@RequestBody ProductDto dto) {
        return productService.saveProduct(dto);
    }
}
