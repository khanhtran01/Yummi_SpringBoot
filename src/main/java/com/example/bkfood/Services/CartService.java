package com.example.bkfood.Services;

import com.example.bkfood.Models.Cart;
import com.example.bkfood.Models.Food;
import com.example.bkfood.Models.User;
import com.example.bkfood.Models.UserDetail;
import com.example.bkfood.Repositories.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CartService {


    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private FoodService foodService;

    public boolean addProductToCart(Long productId){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetail myUser = (UserDetail) authentication.getPrincipal();

        Optional<Food> myFood = foodService.getFoodById(productId);
        System.out.println(myFood.isEmpty());
        if (myFood.isEmpty()) {
            return false;
        }
        Cart checkCart = cartRepository.findByUserIdAndFoodId(myUser.getUser().getId(), productId);
        if (checkCart != null){
            int amount = checkCart.getAmount();
            System.out.println(amount);
            cartRepository.updateAmountOfCart(amount + 1, checkCart.getId());
        }
        else {
            Cart newCart = new Cart(myUser.getUser(), myFood.get(), 1);
            cartRepository.save(newCart);
        }
        return true;
    }
}
