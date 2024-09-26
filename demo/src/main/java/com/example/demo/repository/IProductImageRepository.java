package com.example.demo.repository;

import com.example.demo.model.Product;
import com.example.demo.model.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IProductImageRepository extends JpaRepository<ProductImage, Long> {
    ProductImage findFirstByProduct_ProductId(Long productId);
    List<ProductImage> findByProduct(Product product);
}
