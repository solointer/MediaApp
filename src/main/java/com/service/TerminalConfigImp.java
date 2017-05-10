package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.TerminalConfig;
import com.repository.TerminalConfigJpaRespository;
@Service
public class TerminalConfigImp implements TerminalConfigService{

	@Resource
    private TerminalConfigJpaRespository terminalConfigJpaRespository;
	@Override
	public TerminalConfig findOne(Integer id) {
		// TODO Auto-generated method stub
		return terminalConfigJpaRespository.findOne(id);
	}
	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		terminalConfigJpaRespository.delete(id);
		
	}
	@Override
	public TerminalConfig addTerminalConfig(TerminalConfig group) {
		// TODO Auto-generated method stub
		return terminalConfigJpaRespository.save(group);
	}

}
