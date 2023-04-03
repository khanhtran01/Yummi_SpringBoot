package com.example.bkfood.Controllers.RequestModel;

public class RegisterRequestModel {
    public String username;
    public String password;
    public String repassword;
    public int age;
    public String email;

    @Override
    public String toString() {
        return "RegisterRequestModel{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", repasword='" + repassword + '\'' +
                ", age=" + age +
                ", email='" + email + '\'' +
                '}';
    }
}
