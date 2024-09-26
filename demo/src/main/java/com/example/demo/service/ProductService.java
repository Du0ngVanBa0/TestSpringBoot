package com.example.demo.service;

import com.example.demo.model.Product;
import com.example.demo.repository.IProductRepository;
import com.example.demo.dto.product.ProductFilterDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    @Autowired
    private IProductRepository productRepository;

    public Page<Product> getProducts(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return productRepository.findAll(pageRequest);
    }

    public Page<Product> getFilteredProducts(int page, int size, ProductFilterDTO filterDTO) {
        PageRequest pageRequest = PageRequest.of(page, size);
        
        if (filterDTO == null) {
            return productRepository.findAll(pageRequest);
        }

        return productRepository.findAllByCriteria(
            filterDTO.getCategory(),
            filterDTO.getColor(),
            filterDTO.getSize(),
            filterDTO.getPrice(),
            filterDTO.getStyle(),
            pageRequest
        );
    }
}
