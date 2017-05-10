package com.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.json.JSONException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.model.TerminalConfig;
import com.model.TerminalGroupInfo;
import com.model.TerminalInfo;
import com.model.TerminalTagInfo;
import com.service.TerminalConfigImp;
import com.service.TerminalGroupInfoImp;

import com.service.TerminalInfoImp;
import com.service.TerminalTagInfoImp;



@Controller
public class TerminalController {
	@Resource
    private TerminalGroupInfoImp terminalGroupInfoImp;
	@Resource
    private TerminalTagInfoImp terminalTagInfoImp;
	@Resource
    private TerminalInfoImp terminalInfoImp;
	@Resource
    private TerminalConfigImp terminalConfigImp;
	
	 @RequestMapping("/terminalMangae")
	    public String terminalMangae(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
	        model.addAttribute("name", name);
	        return "/cp/terminal/terminalManage/terminalManage";
	    }
	 @RequestMapping("/terminalControl")
	    public String terminalControl(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
	        model.addAttribute("name", name);
	        return "/cp/terminal/terminalControl/terminalControl";
	    }
	 //创建分组，分别传入分组的名称以及父分组的ID
	 @RequestMapping("/addTerminalGroup")
	 @ResponseBody
		public Map<String,Object>  addTerminalGroup(@RequestParam("name") String groupName,@RequestParam("parentGroupId") Integer groupParentId) {
			System.out.println(groupParentId);
			System.out.println(groupName);
			if(groupParentId == null || groupParentId<0){
				groupParentId = 1;
			}
			TerminalGroupInfo groupInfo = new TerminalGroupInfo();
			groupInfo.setName(groupName);
			groupInfo.setParent_id(groupParentId);
			//更新tb_terminal_group_info表
			TerminalGroupInfo newGroup = terminalGroupInfoImp.addTerminalGroup(groupInfo);
			System.out.println(newGroup.getName());
			System.out.println(newGroup.getParent_id());
			//Integer maxId = terminalGroupInfoImp.getMaxId();
			 //return "/cp/terminal/terminalManage/terminalManage";
			 List<TerminalGroupInfo> allGroupList = terminalGroupInfoImp.findAll();
			 Map<String,Object> map = new HashMap<String,Object>();
			 map.put("result", "success");
		     map.put("data", allGroupList);
			 return map;
		}
	 @RequestMapping("/getTerminalByGroupId")
	 @ResponseBody
	 public  Map<String,Object> getTerminalByGroupId(@RequestParam("id") Integer id){	
		 List<TerminalInfo> allTerminalList = terminalInfoImp.getTerminalByGroupId(id);
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("result", "success");
	     map.put("data", allTerminalList);
		 return map;
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
	 @RequestMapping("/updateGroup")
	 @ResponseBody
	 public  Map<String,Object> updateGroup(@RequestParam("newGroupName") String newGroupName,@RequestParam("groupId") Integer groupId){	
		
		 Map<String,Object> map = new HashMap<String,Object>();
		 terminalGroupInfoImp.updateGroup(groupId, newGroupName);
		 List<TerminalGroupInfo> allGroupList = terminalGroupInfoImp.findAll();
		 map.put("data", allGroupList);
		 map.put("result", "success");
		
		 return map;
	 }
	 @RequestMapping("/getAllTags")
	 @ResponseBody
	 public  Map<String,Object> getAllTags(){	
		 Map<String,Object> map = new HashMap<String,Object>();
		 List<TerminalTagInfo> allTagList = terminalTagInfoImp.findAll();
		 map.put("data", allTagList);
		 map.put("result", "success");
		
		 return map;
	 }
	 @RequestMapping("/updateTag")
	 @ResponseBody
	 public  Map<String,Object> updateTag(@RequestParam("newTagName") String newTagName,@RequestParam("tagId") Integer tagId){	
		
		 Map<String,Object> map = new HashMap<String,Object>();
		 terminalTagInfoImp.updateTag(tagId, newTagName);
		 List<TerminalTagInfo> allTagList = terminalTagInfoImp.findAll();
		 map.put("data", allTagList);
		 map.put("result", "success");
		
		 return map;
	 }
	 @RequestMapping("/deleteTag")
	 @ResponseBody
	 public  Map<String,Object> deleteTag(@RequestParam("tagId") Integer tagId){	
		 terminalTagInfoImp.delete(tagId);
		 Map<String,Object> map = new HashMap<String,Object>();
		 List<TerminalTagInfo> allTagList = terminalTagInfoImp.findAll();
		 map.put("data", allTagList);
		 map.put("result", "success");
		 
		 return map;
	 }
	 @RequestMapping("/createTag")
	 @ResponseBody
	 public  Map<String,Object> createTag(@RequestParam("tagName") String tagName){	
		 TerminalTagInfo tagInfo = new TerminalTagInfo();
		 tagInfo.setName(tagName);
		 terminalTagInfoImp.createTag(tagInfo);
		 Map<String,Object> map = new HashMap<String,Object>();
		 List<TerminalTagInfo> allTagList = terminalTagInfoImp.findAll();
		 map.put("data", allTagList);
		 map.put("result", "success");
		 return map;
	 }
//	 @RequestMapping("/getAllTerminalList")
//	 @ResponseBody
//	 public  List<List<Object>> getAllTerminalList(){
//		 List<List<Object>> res = new ArrayList<List<Object>>();
//
//		 List<TerminalInfo> allTerminalList = terminalInfoImp.findgetTerminalList();
//		 for(int i = 0; i < allTerminalList.size(); i++) {
////			 Map<Object,Object> item = new HashMap<Object,Object>();
//			 List<Object> item = new ArrayList<Object>();
//			 
//			 int id = allTerminalList.get(i).id;
//			 TerminalConfig terConfig =  terminalConfigImp.findOne(id);
//			 TerminalGroupInfo terGroup = terminalGroupInfoImp.findOne(id);
////			 item.put(allTerminalList.get(i), terConfig);
//			 item.add(allTerminalList.get(i));
//			 item.add(terConfig);
//			 item.add(terGroup);
//			 res.add(item);
//		 }
//		 
//		 return res;
//	 }
	 @RequestMapping("/getAllTerminalList")
	 @ResponseBody
	 public   Map<String,Object>  getAllTerminalList(){
		 Map<String,Object> map = new HashMap<String,Object>();
		 List<Object> items = new ArrayList<Object>();
		 List<TerminalInfo> allTerminalList = terminalInfoImp.findgetTerminalList();
		 for(int i = 0; i < allTerminalList.size(); i++) {
			 int id = allTerminalList.get(i).id;
			 TerminalInfo thisTerminal = allTerminalList.get(i);
			 TerminalConfig terConfig =  terminalConfigImp.findOne(id);
			 TerminalGroupInfo terGroup = terminalGroupInfoImp.findOne(allTerminalList.get(i).group_id);
			 JSONObject item = new JSONObject();
			 item.put("id",id);
			 item.put("name",thisTerminal.name);
			 item.put("city",thisTerminal.city);
			 item.put("attrid",thisTerminal.attrib);
			 item.put("audit_state",thisTerminal.audit_state);
			 item.put("expired_date",thisTerminal.expired_date);
			 item.put("mac",thisTerminal.mac);
			 item.put("location",thisTerminal.location);
			 item.put("groupName",terGroup.name);
			 item.put("output_mode",terConfig.output_mode);
			 //分辨率
			 item.put("output_res_h",terConfig.output_res_h);
			 item.put("output_res_v",terConfig.output_res_v);
			 //心跳时间
			 item.put("heartbeat_interval",terConfig.heartbeat_interval);
			 items.add(item);
		 }
		 map.put("data", items);
		 map.put("result", "success");
		 return map;
	 }
	 @RequestMapping("/ajax_terminal_list")
	 @ResponseBody
	 public  Map<String,Object> getListByParams(@RequestParam(value = "page", defaultValue = "1") Integer page,
	         @RequestParam(value = "perPage", defaultValue = "1") Integer perPage) {
		 System.out.println("分页");
		 System.out.println(perPage);
		 Map<String,Object> map = new HashMap<String,Object>();
		 List<Object> items = new ArrayList<Object>();
	     Sort sort = new Sort(Direction.DESC, "id");
	     Pageable pageable = new PageRequest(page-1, perPage, sort);
	     Page<TerminalInfo> list = terminalInfoImp.findALL(pageable);
	     for(int i=0;i<list.getContent().size();i++){
	    	 TerminalInfo thisTerminal = list.getContent().get(i);
	    	 int id = list.getContent().get(i).id;
	    	 TerminalConfig terConfig =  terminalConfigImp.findOne(id);
			 TerminalGroupInfo terGroup = terminalGroupInfoImp.findOne(list.getContent().get(i).group_id);
			 JSONObject item = new JSONObject();
			 item.put("id",id);
			 item.put("name",thisTerminal.name);
			 item.put("city",thisTerminal.city);
			 item.put("attrid",thisTerminal.attrib);
			 item.put("audit_state",thisTerminal.audit_state);
			 item.put("expired_date",thisTerminal.expired_date);
			 item.put("mac",thisTerminal.mac);
			 item.put("location",thisTerminal.location);
			 item.put("groupName",terGroup.name);
			 item.put("output_mode",terConfig.output_mode);
			 //分辨率
			 item.put("output_res_h",terConfig.output_res_h);
			 item.put("output_res_v",terConfig.output_res_v);
			 //心跳时间
			 item.put("heartbeat_interval",terConfig.heartbeat_interval);
			 items.add(item);
	     }
	     map.put("result", "success");
	     map.put("data",items);
	     map.put("totalElements",list.getTotalElements());
	     map.put("totalPages",list.getTotalPages());
	     map.put("numberOfElements",list.getNumberOfElements());
	     map.put("sort",list.getSort());
	     map.put("currentPage",list.getNumber()+1);
	     
	     return map;
	 }
	 @RequestMapping("/createTerminal")
	 @ResponseBody
	 public  Map<String,Object> createTerminal(
			 @RequestParam("mac") Long mac,
			 @RequestParam("name") String name,
			 @RequestParam("no") String no,
			 @RequestParam("location") String location,
			 @RequestParam("city") String city,
			 @RequestParam("group_id") Integer group_id,
			 @RequestParam("output_res_h") Integer output_res_h,
			 @RequestParam("output_res_v") Integer output_res_v,
			 @RequestParam("display_scale") String display_scale,
			 @RequestParam("osd_lang") String osd_lang,
			 @RequestParam("heartbeat_interval") Integer heartbeat_interval,
			 @RequestParam("enable_rc") Integer enable_rc,
			 @RequestParam("file_keep_days") Integer file_keep_days){	
		 System.out.println("初angjiann");
		 TerminalInfo ter = new TerminalInfo();
		 TerminalConfig terCon = new TerminalConfig();
		 ter.mac = mac;
		 ter.name = name;
		 ter.location = location;
		 ter.city = city;
		 ter.group_id = group_id;
		 ter.no = no;
		 TerminalInfo newTer = terminalInfoImp.addTerminalInfo(ter);
		 System.out.println(newTer.id);
		 terCon.terminal_id = newTer.id;
		 terCon.output_res_h = output_res_h;
		 terCon.output_res_v = output_res_v;
		 terCon.display_scale = display_scale;
		 terCon.osd_lang = osd_lang;
		 terCon.heartbeat_interval = heartbeat_interval;
		 terCon.enable_rc = enable_rc;
		 terCon.file_keep_days = file_keep_days;
		 terminalConfigImp.addTerminalConfig(terCon);
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("result", "success");
		 return map;
	 }
	 @RequestMapping("/deleteTerminal")
	 @ResponseBody
	 public  Map<String,Object> deleteTerminal(@RequestParam("terIdArray") String terIdArray){	
		 
		  String[] strArray = terIdArray.split(",");
		  for(int i =0;i<strArray.length;i++){
			  terminalInfoImp.delete(Integer.parseInt(strArray[i]));
			  terminalConfigImp.delete(Integer.parseInt(strArray[i]));	  
		  }
		 //返回所有的终端列表
		  Map<String,Object> map = new HashMap<String,Object>();
			 List<Object> items = new ArrayList<Object>();
			 List<TerminalInfo> allTerminalList = terminalInfoImp.findgetTerminalList();
			 for(int i = 0; i < allTerminalList.size(); i++) {
				 int id = allTerminalList.get(i).id;
				 TerminalInfo thisTerminal = allTerminalList.get(i);
				 TerminalConfig terConfig =  terminalConfigImp.findOne(id);
				 TerminalGroupInfo terGroup = terminalGroupInfoImp.findOne(allTerminalList.get(i).group_id);
				 JSONObject item = new JSONObject();
				 item.put("id",id);
				 item.put("name",thisTerminal.name);
				 item.put("city",thisTerminal.city);
				 item.put("attrid",thisTerminal.attrib);
				 item.put("audit_state",thisTerminal.audit_state);
				 item.put("expired_date",thisTerminal.expired_date);
				 item.put("mac",thisTerminal.mac);
				 item.put("location",thisTerminal.location);
				 item.put("groupName",terGroup.name);
				 item.put("output_mode",terConfig.output_mode);
				 //分辨率
				 item.put("output_res_h",terConfig.output_res_h);
				 item.put("output_res_v",terConfig.output_res_v);
				 items.add(item);
			 }
			 map.put("data", items);
			 map.put("result", "success");
			 return map;
	 }
}
