package com.example.demo.controller;

import com.example.demo.dto.product.ProductDetailResponseDTO;
import com.example.demo.dto.product.ProductFilterDTO;
import com.example.demo.dto.product.ProductResponseDTO;
import com.example.demo.model.Product;
import com.example.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/page")
    public ResponseEntity<Page<ProductResponseDTO>> getProducts(
            @RequestParam(defaultValue = "6") int size,
            @RequestParam(defaultValue = "0") int page
    ) {
        Page<ProductResponseDTO> products = productService.getProducts(page, size);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }
    @GetMapping("/{id}")
    public ResponseEntity<ProductDetailResponseDTO> getProductDetail(@PathVariable Long id) {
        try {
            ProductDetailResponseDTO productDetail = productService.getProductDetail(id);
            return new ResponseEntity<>(productDetail, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/filter")
    public ResponseEntity<Page<ProductResponseDTO>> getFilteredProducts(
            @RequestParam(defaultValue = "6") int size,
            @RequestParam(defaultValue = "0") int page,
            @RequestBody(required = false) ProductFilterDTO filterDTO
    ) {
        Page<ProductResponseDTO> products = productService.getFilteredProducts(page, size, filterDTO);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }
}
