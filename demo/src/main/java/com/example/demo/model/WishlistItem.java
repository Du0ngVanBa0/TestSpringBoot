package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class WishlistItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long wishlistItemId;

    @ManyToOne
    @JoinColumn(name = "wishlistId", nullable = false)
    private Wishlist wishlist;

    @ManyToOne
    @JoinColumn(name = "productId", nullable = false)
    private Product product;
}
