package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.TerminalGroupInfo;
import com.model.TerminalTagInfo;
import com.repository.TerminalGroupInfoJpaRepository;
import com.repository.TerminalGroupInfoRepository;
import com.repository.TerminalTagInfoJpaRepository;
import com.repository.TerminalTagInfoRespository;
@Service
public class TerminalTagInfoImp implements TerminalTagInfoService{

	@Resource
	private TerminalTagInfoJpaRepository terminalTagInfoJpaRepository;
	@Resource
	private TerminalTagInfoRespository terminalTagInfoRespository;
	@Override
	public List<TerminalTagInfo> findAll() {
		// TODO Auto-generated method stub
		return terminalTagInfoJpaRepository.findAll();
	}

	@Override
	public void updateTag(Integer id, String name) {
		// TODO Auto-generated method stub
		terminalTagInfoRespository.updateTag(id, name);
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		terminalTagInfoJpaRepository.delete(id);
		
	}

	@Override
	public TerminalTagInfo createTag(TerminalTagInfo group) {
		// TODO Auto-generated method stub
		TerminalTagInfo newTag = terminalTagInfoJpaRepository.save(group);
		return newTag;
	}

}
