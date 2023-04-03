package com.example.bkfood.Repositories;


import com.example.bkfood.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    public User findByUsername(String username);

    public User findByEmail(String email);

    boolean existsByUsername(String username);

    @Query(value = "UPDATE user SET password = :newPassword WHERE id = :id", nativeQuery = true)
    void updatePassword(String newPassword, Long id);
}
