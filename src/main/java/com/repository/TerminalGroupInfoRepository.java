package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.model.TerminalGroupInfo;
import com.model.User;
//添加事务,否则报错Executing an update/delete query
@Transactional
public interface TerminalGroupInfoRepository extends Repository<TerminalGroupInfo, Integer> {
	 @Query(value = "select id from TerminalGroupInfo u order by id desc limit 1" ,nativeQuery=true)
	 Integer getMaxId();

	 @Modifying
	 @Query(value = "delete from TerminalGroupInfo u where u.parent_id=:parent_id ")
	 void deleteByParentId(@Param("parent_id") Integer parent_id);
	 @Modifying
	 @Query(value = "update  TerminalGroupInfo u set u.name=:name  where u.id=:id ")
	 void updateGroup(@Param("id") Integer id,@Param("name") String name);
}
