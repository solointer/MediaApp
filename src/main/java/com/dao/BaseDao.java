package com.dao;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties.Hibernate;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;


@Repository
@Transactional
//@ComponentScan("org.hibernate.SessionFactory,com.dao")
public abstract class BaseDao<T> {
	
	//@Autowired
	@Resource
	private SessionFactory sessionFactory;	
	
	public Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public Session openSession(){
		return sessionFactory.openSession();
	}
	
	public T find(Session session,String queryString,Object...params){
		Query query = createQuery(session,queryString,params);
		
		@SuppressWarnings("unchecked")
		T t = (T)query.uniqueResult();
		
		return t;
	}
	private Query createQuery(Session session,String queryString,Object...params){
		System.out.println(queryString);
		Query query = session.createQuery(queryString);
		
		System.out.println(params[0]);
		System.out.println(params[1]);
		for(int i=0;i<params.length;i++){
			query.setParameter(i, params[i]);
		}
		return query;
	}

	private Object String(Object object) {
		// TODO Auto-generated method stub
		return null;
	}
	public void add(Session session,String name){
		session.save(name);
	}
	
}
