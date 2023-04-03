package com.example.bkfood.Services;


import com.example.bkfood.Controllers.RequestModel.ChangePasswordModel;
import com.example.bkfood.Controllers.RequestModel.RegisterRequestModel;
import com.example.bkfood.Jwt.JwtTokenProvider;
import com.example.bkfood.Models.User;
import com.example.bkfood.Models.UserDetail;
import com.example.bkfood.Repositories.UserRepository;
import com.example.bkfood.Types.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;


    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    public User findUserByUsername(String username){
        return userRepository.findByUsername(username);
    }

    public boolean register(RegisterRequestModel userInfo){
        System.out.println(userInfo);
        if (!userInfo.password.equals(userInfo.repassword)){
            System.out.println("failed with diff password");
            return false;
        }
        User user = userRepository.findByEmail(userInfo.email);
        User user2 = userRepository.findByUsername(userInfo.username);
        if (user != null || user2 != null){
            System.out.println("failed with exist user");
            return false;
        } else {
            String password = encoder.encode(userInfo.password);
            User newUser = new User(userInfo.username, password, userInfo.email, Role.BUYER, userInfo.age);
            userRepository.save(newUser);
           return true;
        }
    };
    public String login(String username, String password){
        User user = userRepository.findByUsername(username);
        if (user != null) {
            boolean match = encoder.matches(password, user.getPassword());
            if (match){
                String token = jwtTokenProvider.generateToken(user);
                return token;
            }

            return null;
        }
        return null;
    }

    @Override
    public UserDetail loadUserByUsername(String username) throws UsernameNotFoundException {
        if (userRepository.existsByUsername(username)){
            return new UserDetail(userRepository.findByUsername(username));
        }
        throw new UsernameNotFoundException(username);
    }

    public boolean changePassword(ChangePasswordModel changePasswordModel){
        boolean checkUserValid = userRepository.existsByUsername(changePasswordModel.username);

        if (checkUserValid && changePasswordModel.new_password.equals(changePasswordModel.retype_new_password)){
            User user = userRepository.findByUsername(changePasswordModel.username);
            userRepository.updatePassword(encoder.encode(changePasswordModel.new_password), user.getId());
            return true;
        } else {
            return false;
        }
    }
}
