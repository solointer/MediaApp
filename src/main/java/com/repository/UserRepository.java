package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import com.model.User;

public interface UserRepository extends Repository<User, String> {
	 List<User> findByAccountAndPassword(String account, String password);
	 @Query(value = "from User u where u.account=:account")
	 List<User> findByName1(@Param("account") String account);

	 @Query(value = "from User u where u.account=:account")
	 List<User> findByName2(@Param("account") String account);

	 List<User> findByAccount(String account);
}
