package com.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_terminal_info")
public class TerminalInfo {
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
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Long getMac() {
		return mac;
	}
	public void setMac(Long mac) {
		this.mac = mac;
	}
	public String getMac_text() {
		return mac_text;
	}
	public void setMac_text(String mac_text) {
		this.mac_text = mac_text;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getAttrib() {
		return attrib;
	}
	public void setAttrib(int attrib) {
		this.attrib = attrib;
	}
	public String getHw_version() {
		return hw_version;
	}
	public void setHw_version(String hw_version) {
		this.hw_version = hw_version;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getProvince_id() {
		return province_id;
	}
	public void setProvince_id(int province_id) {
		this.province_id = province_id;
	}
	public int getArea_id() {
		return area_id;
	}
	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}
	public Timestamp getExpired_date() {
		return expired_date;
	}
	public void setExpired_date(Timestamp expired_date) {
		this.expired_date = expired_date;
	}
	public double getCoordinatex() {
		return coordinatex;
	}
	public void setCoordinatex(double coordinatex) {
		this.coordinatex = coordinatex;
	}
	public double getCoordinatey() {
		return coordinatey;
	}
	public void setCoordinatey(double coordinatey) {
		this.coordinatey = coordinatey;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Timestamp getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}
	public int getCreator_user_id() {
		return creator_user_id;
	}
	public void setCreator_user_id(int creator_user_id) {
		this.creator_user_id = creator_user_id;
	}
	public int getAudit_state() {
		return audit_state;
	}
	public void setAudit_state(int audit_state) {
		this.audit_state = audit_state;
	}
	public int getAudit_level() {
		return audit_level;
	}
	public void setAudit_level(int audit_level) {
		this.audit_level = audit_level;
	}
	@Id
	//设置主键自增
	@GeneratedValue
	@Column(name="id")
	 public int id;
	@Column(name="corp_id")
	 public int corp_id;
	@Column(name="group_id")
	 public int group_id;
	@Column(name="no")
	 public String no;
	@Column(name="mac")
	 public Long mac;
	@Column(name="mac_text")
	 public String mac_text;
	@Column(name="sn")
	 public String sn;
	@Column(name="name")
	 public String name;
	@Column(name="model")
	 public String model;
	@Column(name="type")
	 public int type;
	@Column(name="attrib")
	 public int attrib;
	@Column(name="hw_version")
	public String hw_version;
	@Column(name="location")
	public String location;
	@Column(name="city")
	public String city;
	@Column(name="province_id")
	 public int province_id;
	@Column(name="area_id")
	 public int area_id;
	@Column(name="expired_date")
	 public Timestamp expired_date;
	@Column(name="coordinatex")
	 public double coordinatex;
	@Column(name="coordinatey")
	 public double coordinatey;
	@Column(name="comment")
	public String comment;
	@Column(name="create_date")
	public Timestamp create_date;
	@Column(name="creator_user_id")
	 public int creator_user_id;
	@Column(name="audit_state")
	 public int audit_state;
	@Column(name="audit_level")
	 public int audit_level;
//	@ManyToOne
//    private TerminalGroupInfo terminalGroup;
//	@ManyToOne
//    private TerminalConfig terminalPlayAttr;
	
	
	
	
	
	
	
	
}
