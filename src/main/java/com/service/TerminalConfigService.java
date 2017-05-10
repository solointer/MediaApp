package com.service;

import com.model.TerminalConfig;
public interface TerminalConfigService {
	 public TerminalConfig addTerminalConfig(TerminalConfig group);
	public TerminalConfig findOne(Integer id);
	public void delete(Integer id);
}
