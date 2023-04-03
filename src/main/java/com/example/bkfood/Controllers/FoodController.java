package com.example.bkfood.Controllers;

import com.example.bkfood.Models.Food;
import com.example.bkfood.Services.FoodService;
import org.hibernate.metamodel.mapping.ForeignKeyDescriptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/food/")
public class FoodController {

    @Autowired
    private FoodService foodService;

    @GetMapping("/getAll")
    public List<Food> getAllFood(){
        return foodService.getAllFood();
    }

    @GetMapping("/getFoodPaging")
    public ResponseEntity<Map<String, Object>> getFoodPaging(@RequestParam("page") int page, @RequestParam("limit") int limit){
        List<Food> foodList = foodService.getFoodPaging(limit, page);

        Map<String, Object> res = new HashMap<>();
        if (foodList != null) {
            res.put("status", true);
            res.put("data", foodList);
            return ResponseEntity.ok(res);
        }
        res.put("status", false);
        return ResponseEntity.badRequest().body(res);
    }
}
