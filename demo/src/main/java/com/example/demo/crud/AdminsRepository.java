package com.example.demo.crud;

import com.example.demo.entity.Admins;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdminsRepository extends JpaRepository<Admins,Integer> {
    List<Admins> findByNameAndPassword(String name,String passWord);
}
