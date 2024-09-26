package com.example.demo.controller;

import com.example.demo.dto.product.ProductFilterDTO;
import com.example.demo.model.Product;
import com.example.demo.service.ProductService;
import jakarta.annotation.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/api/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/page")
    public ResponseEntity<Page<Product>> getProducts(
            @RequestParam(defaultValue = "6") int size,
            @RequestParam(defaultValue = "0") int page
    ) {
        Page<Product> products = productService.getProducts(page, size);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

    @GetMapping("/filter")
    public ResponseEntity<Page<Product>> getFilteredProducts(
            @RequestParam(defaultValue = "6") int size,
            @RequestParam(defaultValue = "0") int page,
            @RequestBody @Nullable ProductFilterDTO filterDTO
    ) {
        Page<Product> products = productService.getFilteredProducts(page, size, filterDTO);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }
}
