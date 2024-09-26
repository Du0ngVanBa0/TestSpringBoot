package com.example.demo.dto.product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductFilterDTO {
    private String category;
    private String color;
    private String size;
    private Double price;
    private String style;
}
