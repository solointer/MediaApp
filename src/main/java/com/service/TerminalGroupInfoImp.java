package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.TerminalGroupInfo;
import com.repository.TerminalGroupInfoJpaRepository;
import com.repository.TerminalGroupInfoRepository;

@Service
public class TerminalGroupInfoImp  implements TerminalGroupInfoService{
	
	@Resource
	private TerminalGroupInfoJpaRepository terminalGroupInfoJpaRepository;
	@Resource
	private TerminalGroupInfoRepository terminalGroupInfoRepository;
	@Override
	public TerminalGroupInfo addTerminalGroup(TerminalGroupInfo group) {
		// TODO Auto-generated method stub
		TerminalGroupInfo newGroup = terminalGroupInfoJpaRepository.save(group);
		return newGroup;
	}

	@Override
	public TerminalGroupInfo findOne(Integer id) {
		// TODO Auto-generated method stub
		 return terminalGroupInfoJpaRepository.findOne(id);
	}

	@Override
	public Integer getMaxId() {
		// TODO Auto-generated method stub
		return terminalGroupInfoRepository.getMaxId();
	}

	@Override
	public List<TerminalGroupInfo> findAll() {
		return terminalGroupInfoJpaRepository.findAll();
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		 terminalGroupInfoJpaRepository.delete(id);
	}

	@Override
	public void deleteByParentId(Integer parent_id) {
		// TODO Auto-generated method stub
		terminalGroupInfoRepository.deleteByParentId(parent_id);
	}

	@Override
	public void updateGroup(Integer id, String name) {
		// TODO Auto-generated method stub
		terminalGroupInfoRepository.updateGroup(id, name);
	}
	
}
