package com.controller;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.form.UserLoginForm;
import com.model.User;
import com.service.IUserService;

@RestController
@RequestMapping(value = "/users")
public class UserController {
	 	@Resource
	    private IUserService userService2;
	 	 @RequestMapping(value = "/search/name/{name}")
	     public ModelAndView  getBookByName(@PathVariable UserLoginForm userLoginForm)
	     {
	         List<User> users = userService2.findByName(userLoginForm.getAccount(),userLoginForm.getPassword());
	         if (users!=null) {
	        	 ModelAndView mv = new ModelAndView("/cp/index/index");
					return mv;
				} else {
					 ModelAndView mv = new ModelAndView("/cp/login/login");
					return mv;
				}
	     }

}
