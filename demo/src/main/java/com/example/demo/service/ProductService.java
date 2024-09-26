package com.example.demo.service;

import com.example.demo.model.Product;
import com.example.demo.model.Promotion;
import com.example.demo.model.Review;
import com.example.demo.model.ProductImage;
import com.example.demo.repository.IProductImageRepository;
import com.example.demo.repository.IProductRepository;
import com.example.demo.repository.IPromotionRepository;
import com.example.demo.repository.IReviewRepository;
import com.example.demo.dto.product.ProductFilterDTO;
import com.example.demo.dto.product.ProductResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    private IProductRepository productRepository;

    @Autowired
    private IPromotionRepository promotionRepository;

    @Autowired
    private IReviewRepository reviewRepository;

    @Autowired
    private IProductImageRepository productImageRepository;

    public Page<ProductResponseDTO> getProducts(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        Page<Product> productPage = productRepository.findAll(pageRequest);

        List<ProductResponseDTO> productResponseList = productPage.getContent().stream().map(product -> {
            Promotion promotion = promotionRepository.findFirstActivePromotionByProduct(product, LocalDateTime.now());
            double averageRating = getAverageRatingForProduct(product);
            int reviewCount = getReviewCountForProduct(product);
            String imageUrl = getImageUrlForProduct(product);

            return new ProductResponseDTO(
                product.getProductId(),
                product.getName(),
                product.getDescription(),
                promotion != null ? product.getPrice() * (1 - promotion.getDiscountPercent() / 100) : product.getPrice(),
                product.getPrice(),
                promotion != null ? promotion.getDiscountPercent() : 0.0,
                averageRating,
                reviewCount,
                imageUrl
            );
        }).collect(Collectors.toList());

        return new PageImpl<>(productResponseList, pageRequest, productPage.getTotalElements());
    }

    public Page<ProductResponseDTO> getFilteredProducts(int page, int size, ProductFilterDTO filterDTO) {
        PageRequest pageRequest = PageRequest.of(page, size);
        
        if (filterDTO == null) {
            return getProducts(page, size);
        }

        Page<Product> productPage = productRepository.findAllByCriteria(
            filterDTO.getCategory(),
            filterDTO.getColor(),
            filterDTO.getSize(),
            filterDTO.getPrice(),
            filterDTO.getStyle(),
            pageRequest
        );

        List<ProductResponseDTO> productResponseList = productPage.getContent().stream().map(product -> {
            Promotion promotion = promotionRepository.findFirstActivePromotionByProduct(product, LocalDateTime.now());
            double averageRating = getAverageRatingForProduct(product);
            int reviewCount = getReviewCountForProduct(product);
            String imageUrl = getImageUrlForProduct(product);

            return new ProductResponseDTO(
                product.getProductId(),
                product.getName(),
                product.getDescription(),
                promotion != null ? product.getPrice() * (1 - promotion.getDiscountPercent() / 100) : product.getPrice(),
                product.getPrice(),
                promotion != null ? promotion.getDiscountPercent() : 0.0,
                averageRating,
                reviewCount,
                imageUrl
            );
        }).collect(Collectors.toList());

        return new PageImpl<>(productResponseList, pageRequest, productPage.getTotalElements());
    }

    private double getAverageRatingForProduct(Product product) {
        List<Review> reviews = reviewRepository.findByProductId(product.getProductId());
        return reviews.stream().mapToInt(Review::getRating).average().orElse(0.0);
    }

    private int getReviewCountForProduct(Product product) {
        return reviewRepository.findByProductId(product.getProductId()).size();
    }

    private String getImageUrlForProduct(Product product) {
        ProductImage productImage = productImageRepository.findFirstByProduct_ProductId(product.getProductId());
        return productImage != null ? productImage.getImageUrl() : "default_image_url"; // Thay thế bằng URL hình ảnh mặc định nếu không có
    }
}
