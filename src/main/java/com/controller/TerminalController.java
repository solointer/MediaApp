package com.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model.TerminalGroupInfo;
import com.service.IUserService;
import com.service.TerminalGroupInfoImp;
import com.service.TerminalGroupInfoService;

@Controller
public class TerminalController {
	@Resource
    private TerminalGroupInfoImp terminalGroupInfoImp;
	 @RequestMapping("/terminalMangae")
	    public String terminalMangae(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
	        model.addAttribute("name", name);
	        System.out.println("终端管理");
	        return "/cp/terminal/terminalManage/terminalManage";
	    }
	 //创建分组，分别传入分组的名称以及父分组的ID
	 @RequestMapping("/addTerminalGroup")
		public String addTerminalGroup(@RequestParam("name") String groupName,@RequestParam("parentGroupId") Integer groupParentId) {
			System.out.println(groupParentId);
			System.out.println(groupName);
			TerminalGroupInfo groupInfo = new TerminalGroupInfo();
			groupInfo.setName(groupName);
			groupInfo.setParent_id(groupParentId);
			//更新tb_terminal_group_info表
			TerminalGroupInfo newGroup = terminalGroupInfoImp.addTerminalGroup(groupInfo);
			System.out.println(newGroup.getName());
			System.out.println(newGroup.getParent_id());
			//Integer maxId = terminalGroupInfoImp.getMaxId();
			 return "/cp/terminal/terminalManage/terminalManage";
		}
	 @RequestMapping("/getAllGroup")
	 @ResponseBody
	 public  Map<String,Object> getAllGroup(){	
		 List<TerminalGroupInfo> allGroupList = terminalGroupInfoImp.findAll();
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("result", "success");
	     map.put("data", allGroupList);
		 return map;
	 }
	 @RequestMapping("/deleteGroup")
	 @ResponseBody
	 public  Map<String,Object> deleteGroup(@RequestParam("groupId") Integer groupId){	
		 terminalGroupInfoImp.delete(groupId);
		 terminalGroupInfoImp.deleteByParentId(groupId);
		 Map<String,Object> map = new HashMap<String,Object>();
		 List<TerminalGroupInfo> allGroupList = terminalGroupInfoImp.findAll();
		 map.put("data", allGroupList);
		 map.put("result", "success");
		 
		 return map;
	 }
}
