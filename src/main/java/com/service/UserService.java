package com.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.Person;
import com.model.User;

@Service
public class UserService {		
		
//		@Autowired
		@Resource
		UserDao userDao;
		
		public Person checkLoginUser(String account,String password) {
    		User user = userDao.findByAccountAndPassword(account, password);
    		if (user==null)
    			return null;
    		Person person = new Person();
    		person.setAccount(user.getAccount());
    		person.setPassword(user.getPassword());
    		return person;
    	}
    
}
