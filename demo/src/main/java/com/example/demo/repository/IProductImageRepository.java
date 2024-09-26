package com.example.demo.repository;

import com.example.demo.model.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IProductImageRepository extends JpaRepository<ProductImage, Long> {
    ProductImage findFirstByProduct_ProductId(Long productId);}
