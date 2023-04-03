package com.example.bkfood.Repositories;

import com.example.bkfood.Models.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    List<Cart> findAll();

    Cart findByUserId(Long userId);

    @Query(value = "SELECT * FROM Cart WHERE user_id = :userId AND food_id = :foodId", nativeQuery = true)
    Cart findByUserIdAndFoodId(Long userId, Long foodId);


//    @Query("SELECT c FROM Cart c WHERE c.userId = :userId AND c.foodId = :foodId")
//    Cart findByUserIdAndFoodId(Long userId, Long foodId);

    @Query(value = "UPDATE cart SET amount = :amount WHERE id = :cartId", nativeQuery = true)
    void updateAmountOfCart(int amount, Long cartId);
}
