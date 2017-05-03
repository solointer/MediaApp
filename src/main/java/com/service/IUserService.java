package com.service;

import java.util.List;

import com.model.User;

public interface IUserService {
	  	public List<User> findAll();

	    public void saveUser(User book);
	   
	    public User findOne(String id);

	    public void delete(String id);

	    public List<User> findByName(String name,String Password);
}
