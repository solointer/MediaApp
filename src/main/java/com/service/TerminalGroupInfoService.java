package com.service;

import java.util.List;

import com.model.TerminalGroupInfo;

public interface TerminalGroupInfoService {
		public List<TerminalGroupInfo> findAll();
	  public TerminalGroupInfo addTerminalGroup(TerminalGroupInfo group);
	   
	  public TerminalGroupInfo findOne(Integer id);
	  
	  public Integer getMaxId();
	  public void delete(Integer id);
	  public void deleteByParentId(Integer parent_id);
}
