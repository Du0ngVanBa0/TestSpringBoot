package com.example.demo.dto.product;

import java.time.LocalDateTime;
import java.util.List;

public record ProductDetailResponseDTO(
        Long productId,
        String name,
        String description,
        double oldPrice,
        double newPrice,
        LocalDateTime promotionEndTime,
        double averageRating,
        int reviewCount,
        List<String> colors,
        List<String> sizes,
        List<String> imageUrls
) {
}
