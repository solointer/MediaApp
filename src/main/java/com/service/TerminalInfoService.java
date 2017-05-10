package com.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.model.TerminalGroupInfo;
import com.model.TerminalInfo;

public interface TerminalInfoService {
	public TerminalInfo addTerminalInfo(TerminalInfo group);
	public List<TerminalInfo>findgetTerminalList();
	public void delete(Integer id);
	public  List<TerminalInfo> getTerminalByGroupId(Integer id);
	Page<TerminalInfo> findALL(Pageable pageable);
}
