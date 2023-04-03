package com.example.bkfood.Controllers;

import com.example.bkfood.Services.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @PutMapping("/addFood/{foodId}")
    public boolean addFoodToCart(@PathVariable("foodId") Long foodId){
        boolean status = cartService.addProductToCart(foodId);
        return status;
    }
}
