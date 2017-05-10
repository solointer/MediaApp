package com.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.model.TerminalInfo;

public interface TerminalInfoJpaRespository extends JpaRepository<TerminalInfo,Integer>, PagingAndSortingRepository<TerminalInfo, Integer> {
	 
}
