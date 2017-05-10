package com.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.model.TerminalTagInfo;
@Transactional
public interface TerminalTagInfoRespository extends Repository<TerminalTagInfo, Integer> {
	 @Modifying
	 @Query(value = "update  TerminalTagInfo u set u.name=:name  where u.id=:id ")
	 void updateTag(@Param("id") Integer id,@Param("name") String name);
	
}
