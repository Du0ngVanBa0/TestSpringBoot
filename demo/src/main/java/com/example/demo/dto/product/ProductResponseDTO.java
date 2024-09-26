package com.example.demo.dto.product;

import lombok.Getter;
import lombok.Setter;

public record ProductResponseDTO (
     Long productId,
     String name,
     String description,
     Double price,
     Double originalPrice,
     Double discount,
     Double averageRating,
     Integer reviewCount,
     String imageUrl
){}
