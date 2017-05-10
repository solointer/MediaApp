package com.service;

import java.util.List;

import com.model.TerminalGroupInfo;
import com.model.TerminalTagInfo;

public interface TerminalTagInfoService {
	public List<TerminalTagInfo> findAll();
	public void updateTag(Integer id,String name);
	public void delete(Integer id);
	public TerminalTagInfo createTag(TerminalTagInfo tag);
}
