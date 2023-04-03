package com.example.bkfood.Repositories;

import com.example.bkfood.Models.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FoodRepository extends JpaRepository<Food, Long> {

    @Override
    List<Food> findAll();

    @Override
    Optional<Food> findById(Long aLong);

    @Query(value = "SELECT * FROM food WHERE 1 LIMIT :limit OFFSET :offset", nativeQuery = true)
    List<Food> getFoodPaging(int limit, int offset);
}
