package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.model.TerminalInfo;
import com.model.User;
@Transactional
public interface TerminalInfoRespository extends Repository<TerminalInfo, Integer>{
//	SELECT DISTINCT t FROM Team t JOIN t.players p where p.name LIKE :name 
	@Query("select t from TerminalInfo t")
	 //@Query("select * from student t left join clazz tt where t.clazz_id = tt.id",nativeQuery=true)
	    List<TerminalInfo> findgetTerminalList();
	 @Query(value = "from TerminalInfo u where u.group_id=:group_id")
	 List<TerminalInfo> getTerminalByGroupId(@Param("group_id") Integer group_id);
}
