package com.example.demo.repository;

import com.example.demo.model.Product;
import com.example.demo.dto.product.ProductFilterDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IProductRepository extends JpaRepository<Product, Long> {
    
    @Query("SELECT p FROM Product p " +
           "WHERE (:category IS NULL OR p.category.name = :category) " +
           "AND (:color IS NULL OR EXISTS (SELECT pv FROM ProductVariant pv WHERE pv.product = p AND pv.color.name = :color)) " +
           "AND (:size IS NULL OR EXISTS (SELECT pv FROM ProductVariant pv WHERE pv.product = p AND pv.size.name = :size)) " +
           "AND (:price IS NULL OR p.price <= :price) " +
           "AND (:style IS NULL OR p.style.name = :style)")
    Page<Product> findAllByCriteria(@Param("category") String category,
                                     @Param("color") String color,
                                     @Param("size") String size,
                                     @Param("price") Double price,
                                     @Param("style") String style,
                                     Pageable pageable);
}
