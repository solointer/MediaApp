package com.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.entity.Person;
import com.form.UserLoginForm;
import com.model.User;
import com.service.UserService;
import com.service.UserServiceImpl;


@Controller
public class LoginController {

	@Resource
	UserServiceImpl userService2;

	 // @RequestMapping(path = "/login", method = RequestMethod.GET)
	  @RequestMapping(value = "/login")
	    public String loginPage(@RequestParam(value="name", required=false, defaultValue="World") String name,@Valid UserLoginForm userLoginForm, BindingResult result, Model model) {
	        model.addAttribute("name", name);
	        return "/cp/login/login";
	    }
	  @RequestMapping("/index")
	    public String index(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
	        model.addAttribute("name", name);
	        return "/cp/index/index";
	    }
	    // 检查登录用户的用户名、密码是否与数据库中的一致
	  @RequestMapping(path = "/list", method = RequestMethod.GET)  
	    public String login_check(@ModelAttribute("userLoginForm") UserLoginForm userLoginForm,HttpSession session,Model model) {
		  System.out.print("-----------");
		  System.out.print(userLoginForm.getAccount());
		  System.out.print(userLoginForm.getPassword());
		  System.out.println(userService2);
//	    	return "/cp/index/index";
	       List<User> user = userService2.findByName(userLoginForm.getAccount(),userLoginForm.getPassword());
	        //System.out.println(person.getAccount());
	        System.out.println(user);
	      
	        
	            user.get(0).getAccount();  
	            //System.out.println(list.get(i));  
	        if (user.get(0)!=null) {
				session.setAttribute("user",user);
				return "/cp/index/index";
			} else {
				model.addAttribute("loginError", "login.error");
				return "/cp/login/login";
			}

	}
}
