package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.model.User;
import com.repository.UserJpaRepository;
import com.repository.UserRepository;

@Service
//@Transactional
public class UserServiceImpl  implements IUserService{
	@Resource
    private UserJpaRepository userJpaRepository;
	@Resource
    private UserRepository userRepository;

    public List<User> findAll()
    {
        return userJpaRepository.findAll();
    }
    public List<User> findByName(String name,String password)
    {
        List<User> userList1 = userRepository.findByName1(name);
        List<User> userList2 = userRepository.findByName2(name);
        List<User> userList3 = userRepository.findByAccountAndPassword(name,password);
        System.out.println("userList1:" + userList1);
        System.out.println("userList2:" + userList2);
        System.out.println("userList3:" + userList3);
        //return userRepository.findByAccount(name);
        return userList3;
    }
    public void saveUser(User book)
    {
        userJpaRepository.save(book);
    }

    @Cacheable("users")
    public User findOne(String id)
    {
        System.out.println("Cached Pages");
        return userJpaRepository.findOne(id);
    }

    public void delete(String id)
    {
        userJpaRepository.delete(id);
    }

}
