package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class ProductVariant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long variantId;

    private Integer stockQuantity;

    private Double price;

    @ManyToOne
    @JoinColumn(name = "productId", nullable = false)
    private Product product;

    @ManyToOne
    @JoinColumn(name = "sizeId", nullable = false)
    private Size size;

    @ManyToOne
    @JoinColumn(name = "colorId", nullable = false)
    private Color color;
}