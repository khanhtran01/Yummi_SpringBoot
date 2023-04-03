package com.example.bkfood.Services;

import com.example.bkfood.Models.Food;
import com.example.bkfood.Repositories.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FoodService {

    @Autowired
    private FoodRepository foodRepository;


    public Optional<Food> getFoodById(Long id){
        return foodRepository.findById(id);
    }
    public List<Food> getAllFood(){
        return foodRepository.findAll();
    }

    public List<Food> getFoodPaging(int limit, int page){
        return foodRepository.getFoodPaging(limit, page * limit);
    }
}
