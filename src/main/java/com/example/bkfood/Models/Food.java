package com.example.bkfood.Models;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Food {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String food_name;

    private double base_price;

    private String des;

    private float rating;

    private String category;

    @OneToMany(mappedBy = "food")
    private List<Cart> cartList;

    public Food() {
    }

    public Food(String food_name, double base_price, String des, float rating, String category) {
        this.food_name = food_name;
        this.base_price = base_price;
        this.des = des;
        this.rating = rating;
        this.category = category;
    }

    public String getFood_name() {
        return food_name;
    }

    public void setFood_name(String food_name) {
        this.food_name = food_name;
    }

    public double getBase_price() {
        return base_price;
    }

    public void setBase_price(double base_price) {
        this.base_price = base_price;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", food_name='" + food_name + '\'' +
                ", base_price=" + base_price +
                ", des='" + des + '\'' +
                ", rating=" + rating +
                ", category='" + category + '\'' +
                '}';
    }
}
