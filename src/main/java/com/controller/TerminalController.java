package com.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TerminalController {
	
	 @RequestMapping("/terminalMangae")
	    public String terminalMangae(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
	        model.addAttribute("name", name);
	        System.out.println("终端管理");
	        return "/cp/terminal/terminalManage/terminalManage";
	    }
	 @RequestMapping(value = "/addTerminalGroup", method = RequestMethod.POST)
		public String addTerminalGroup(@RequestParam("name") String groupName) {
			
			return "register";
		}
}
