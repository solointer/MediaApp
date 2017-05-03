package com.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_terminal_group_info")
public class TerminalGroupInfo {
	@Id
	//设置主键自增
	@GeneratedValue
	@Column(name="id")
	 public int id;
	@Column(name="corp_id")
	 public int corp_id;
	@Column(name="name")
	 public String name;
	@Column(name="parent_id")
	 public int parent_id;
	@Column(name="time_stamp")
	 @org.hibernate.annotations.CreationTimestamp   
	 public Timestamp  time_stamp;
	@Column(name="castmsg")
	public String castmsg;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCorp_id() {
		return corp_id;
	}
	public void setCorp_id(int corp_id) {
		this.corp_id = corp_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public Timestamp getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(Timestamp time_stamp) {
		this.time_stamp = time_stamp;
	}
	public String getCastmsg() {
		return castmsg;
	}
	public void setCastmsg(String castmsg) {
		this.castmsg = castmsg;
	}

	
	
}	
