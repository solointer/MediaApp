package com.dao;


import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.model.User;

@Repository
@Transactional
public class UserDao extends BaseDao<User>{
	
	public User findByAccountAndPassword(String account, String password) {
		//return find(getCurrentSession(),"from com.model.User s where s.account =? and s.password =?", account, password);
		return find(getCurrentSession(),"from com.model.User s where s.account=? and s.password=?", account, password);
//		return find(getCurrentSession(),"from com.model.User s where s.accunt='root' and s.password='123456'");
	}
}
