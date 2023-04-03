package com.example.bkfood.Jwt;

import com.example.bkfood.Models.User;
import io.jsonwebtoken.*;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class JwtTokenProvider {
    private String JWT_SECRET = "thiscode";

    final private Long JWT_EXPIRE = 6040000L;


    // generate token
    public String generateToken(User user){
        Date now = new Date();

        Date dateExpiration = new Date(now.getTime() + JWT_EXPIRE);

//        return "hard token";
        return Jwts.builder()
                .setSubject(user.getUsername())
                .setIssuedAt(now)
                .setExpiration(dateExpiration)
                .signWith(SignatureAlgorithm.HS512, JWT_SECRET)
                .compact();
    }

    // get user from jwt token
    public String getUserFromToken(String token){
        Claims claims = Jwts.parser()
                .setSigningKey(JWT_SECRET)
                .parseClaimsJws(token)
                .getBody();
        return claims.getSubject();
    }



    public boolean validateToken(String token){
        try {
            Jwts.parser().setSigningKey(JWT_SECRET).parseClaimsJws(token);
            return true;
        }
        catch (MalformedJwtException mje) {
            System.out.println("Invalid Jwt token");
        }
        catch (ExpiredJwtException eje){
            System.out.println("Expired jwt token");
        }
        catch (UnsupportedJwtException ust){
            System.out.println("Unsupported jwt token");
        }
        catch (IllegalArgumentException ile){
            System.out.println("Empty jwt token");
        }
        return false;
    }
}
