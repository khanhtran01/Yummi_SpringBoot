package com.example.bkfood.Controllers;


import com.example.bkfood.Controllers.RequestModel.ChangePasswordModel;
import com.example.bkfood.Controllers.RequestModel.LoginRequestModel;
import com.example.bkfood.Controllers.RequestModel.RegisterRequestModel;
import com.example.bkfood.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.parameters.P;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;


    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> Login(@RequestBody LoginRequestModel user){
        System.out.println(user.username);
        System.out.println(user.password);
        String token = userService.login(user.username, user.password);
        Map<String, Object> res = new HashMap<>();
        if (token != null){
            res.put("status" , true);
            res.put("token", token);
            return ResponseEntity.ok(res);
        }
        res.put("status", false);
        return ResponseEntity.badRequest().body(res);
    }

    @PostMapping("/register")
    public ResponseEntity<Map<String, Object>> Register(@RequestBody RegisterRequestModel userInfo){
        Map<String, Object> res = new HashMap<>();

        if (userService.register(userInfo)){
            res.put("status", true);
            return ResponseEntity.ok(res);
        }
        res.put("status", false);
        return ResponseEntity.badRequest().body(res);
    }

    @PostMapping("/changePassword")
    public ResponseEntity<Map<String, Object>> ChangePassword(@RequestBody ChangePasswordModel changePasswordModel){
        Map<String, Object> res = new HashMap<>();
        boolean changePasswordStatus = userService.changePassword(changePasswordModel);
        if (changePasswordStatus){
            res.put("status", true);
            return ResponseEntity.ok(res);
        }
        res.put("status", false);
        return ResponseEntity.badRequest().body(res);
    }
}
