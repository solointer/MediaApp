package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.User;

public interface UserJpaRepository extends JpaRepository<User,String> {

}
