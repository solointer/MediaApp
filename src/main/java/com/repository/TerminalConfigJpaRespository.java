package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.TerminalConfig;
public interface TerminalConfigJpaRespository extends JpaRepository<TerminalConfig,Integer>{
	
}
