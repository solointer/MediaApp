package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.model.TerminalInfo;
import com.repository.TerminalInfoJpaRespository;
import com.repository.TerminalInfoRespository;
@Service
public class TerminalInfoImp implements TerminalInfoService{

	@Resource
	private TerminalInfoJpaRespository terminalInfoJpaRespository;
	@Resource
	private TerminalInfoRespository terminalInfoRespository;
	@Override
	public List<TerminalInfo> findgetTerminalList() {
		// TODO Auto-generated method stub
		return terminalInfoRespository.findgetTerminalList();
	}
	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		terminalInfoJpaRespository.delete(id);
		
	}
	@Override
	public List<TerminalInfo> getTerminalByGroupId(Integer id) {
		// TODO Auto-generated method stub
		return terminalInfoRespository.getTerminalByGroupId(id);
	}
	@Override
	public Page<TerminalInfo> findALL(Pageable pageable) {
		// TODO Auto-generated method stub
		return  terminalInfoJpaRespository.findAll(pageable);
	}
	@Override
	public TerminalInfo addTerminalInfo(TerminalInfo group) {
		// TODO Auto-generated method stub
		return terminalInfoJpaRespository.save(group);
	}

}
