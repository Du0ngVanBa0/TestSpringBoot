package com.example.demo.repository;

import com.example.demo.model.Promotion;
import com.example.demo.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;

public interface IPromotionRepository extends JpaRepository<Promotion, Long> {
    @Query("SELECT p FROM Promotion p WHERE p.product = :product AND p.startTime <= :currentTime AND p.endTime >= :currentTime ORDER BY p.startTime ASC")
    Promotion findFirstActivePromotionByProduct(@Param("product") Product product, @Param("currentTime") LocalDateTime currentTime);
}
