package com.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_terminal_config")
public class TerminalConfig {
	@Id
	//设置主键自增
	//@GeneratedValue
	@Column(name="terminal_id")
	 public int terminal_id;
	@Column(name="display_type")
	 public int display_type;
	@Column(name="display_scale")
	 public String display_scale;
	@Column(name="display_res_h")
	 public int display_res_h;
	@Column(name="display_res_v")
	 public int display_res_v;
	@Column(name="output_type")
	 public int output_type;
	@Column(name="output_mode")
	 public String output_mode;
	@Column(name="output_res_h")
	 public int output_res_h;
	@Column(name="output_res_v")
	 public int output_res_v;
	@Column(name="output_offset_x")
	 public int output_offset_x;
	@Column(name="output_offset_y")
	 public int output_offset_y;
	@Column(name="heartbeat_interval")
	public int heartbeat_interval;
	@Column(name="enable_telnet")
	public int enable_telnet;
	@Column(name="telnet_password")
	public String telnet_password;
	@Column(name="system_password")
	 public String system_password;
	@Column(name="enable_web")
	 public int enable_web;
	@Column(name="enable_rc")
	 public int enable_rc;
	@Column(name="time_zone")
	 public int time_zone;
	@Column(name="osd_lang")
	 public String osd_lang;
	@Column(name="default_volumn")
	public int default_volumn;
	@Column(name="default_brightness")
	public int default_brightness;
	@Column(name="network_connect_type")
	 public int network_connect_type;
	@Column(name="dhcp_server")
	 public String dhcp_server;
	@Column(name="network_ip")
	 public String network_ip;
	@Column(name="network_mask")
	 public String network_mask;
	@Column(name="network_gateway")
	 public String network_gateway;
	@Column(name="network_dns1")
	 public String network_dns1;
	@Column(name="network_dns2")
	 public String network_dns2;
	@Column(name="network_user")
	 public String network_user;
	@Column(name="network_password")
	 public String network_password;
	@Column(name="file_keep_days")
	 public int file_keep_days;
	@Column(name="extra_config")
	 public String extra_config;
	@Column(name="time_stamp")
	 @org.hibernate.annotations.CreationTimestamp   
	 public Timestamp time_stamp;
	@Column(name="redisplay_ratio")
	 public int redisplay_ratio;
	public int getTerminal_id() {
		return terminal_id;
	}
	public void setTerminal_id(int terminal_id) {
		this.terminal_id = terminal_id;
	}
	public int getDisplay_type() {
		return display_type;
	}
	public void setDisplay_type(int display_type) {
		this.display_type = display_type;
	}
	public String getDisplay_scale() {
		return display_scale;
	}
	public void setDisplay_scale(String display_scale) {
		this.display_scale = display_scale;
	}
	public int getDisplay_res_h() {
		return display_res_h;
	}
	public void setDisplay_res_h(int display_res_h) {
		this.display_res_h = display_res_h;
	}
	public int getDisplay_res_v() {
		return display_res_v;
	}
	public void setDisplay_res_v(int display_res_v) {
		this.display_res_v = display_res_v;
	}
	public int getOutput_type() {
		return output_type;
	}
	public void setOutput_type(int output_type) {
		this.output_type = output_type;
	}
	public String getOutput_mode() {
		return output_mode;
	}
	public void setOutput_mode(String output_mode) {
		this.output_mode = output_mode;
	}
	public int getOutput_res_h() {
		return output_res_h;
	}
	public void setOutput_res_h(int output_res_h) {
		this.output_res_h = output_res_h;
	}
	public int getOutput_res_v() {
		return output_res_v;
	}
	public void setOutput_res_v(int output_res_v) {
		this.output_res_v = output_res_v;
	}
	public int getOutput_offset_x() {
		return output_offset_x;
	}
	public void setOutput_offset_x(int output_offset_x) {
		this.output_offset_x = output_offset_x;
	}
	public int getOutput_offset_y() {
		return output_offset_y;
	}
	public void setOutput_offset_y(int output_offset_y) {
		this.output_offset_y = output_offset_y;
	}
	public int getHeartbeat_interval() {
		return heartbeat_interval;
	}
	public void setHeartbeat_interval(int heartbeat_interval) {
		this.heartbeat_interval = heartbeat_interval;
	}
	public int getEnable_telnet() {
		return enable_telnet;
	}
	public void setEnable_telnet(int enable_telnet) {
		this.enable_telnet = enable_telnet;
	}
	public String getTelnet_password() {
		return telnet_password;
	}
	public void setTelnet_password(String telnet_password) {
		this.telnet_password = telnet_password;
	}
	public String getSystem_password() {
		return system_password;
	}
	public void setSystem_password(String system_password) {
		this.system_password = system_password;
	}
	public int getEnable_web() {
		return enable_web;
	}
	public void setEnable_web(int enable_web) {
		this.enable_web = enable_web;
	}
	public int getEnable_rc() {
		return enable_rc;
	}
	public void setEnable_rc(int enable_rc) {
		this.enable_rc = enable_rc;
	}
	public int getTime_zone() {
		return time_zone;
	}
	public void setTime_zone(int time_zone) {
		this.time_zone = time_zone;
	}
	public String getOsd_lang() {
		return osd_lang;
	}
	public void setOsd_lang(String osd_lang) {
		this.osd_lang = osd_lang;
	}
	public int getDefault_volumn() {
		return default_volumn;
	}
	public void setDefault_volumn(int default_volumn) {
		this.default_volumn = default_volumn;
	}
	public int getDefault_brightness() {
		return default_brightness;
	}
	public void setDefault_brightness(int default_brightness) {
		this.default_brightness = default_brightness;
	}
	public int getNetwork_connect_type() {
		return network_connect_type;
	}
	public void setNetwork_connect_type(int network_connect_type) {
		this.network_connect_type = network_connect_type;
	}
	public String getDhcp_server() {
		return dhcp_server;
	}
	public void setDhcp_server(String dhcp_server) {
		this.dhcp_server = dhcp_server;
	}
	public String getNetwork_ip() {
		return network_ip;
	}
	public void setNetwork_ip(String network_ip) {
		this.network_ip = network_ip;
	}
	public String getNetwork_mask() {
		return network_mask;
	}
	public void setNetwork_mask(String network_mask) {
		this.network_mask = network_mask;
	}
	public String getNetwork_gateway() {
		return network_gateway;
	}
	public void setNetwork_gateway(String network_gateway) {
		this.network_gateway = network_gateway;
	}
	public String getNetwork_dns1() {
		return network_dns1;
	}
	public void setNetwork_dns1(String network_dns1) {
		this.network_dns1 = network_dns1;
	}
	public String getNetwork_dns2() {
		return network_dns2;
	}
	public void setNetwork_dns2(String network_dns2) {
		this.network_dns2 = network_dns2;
	}
	public String getNetwork_user() {
		return network_user;
	}
	public void setNetwork_user(String network_user) {
		this.network_user = network_user;
	}
	public String getNetwork_password() {
		return network_password;
	}
	public void setNetwork_password(String network_password) {
		this.network_password = network_password;
	}
	public int getFile_keep_days() {
		return file_keep_days;
	}
	public void setFile_keep_days(int file_keep_days) {
		this.file_keep_days = file_keep_days;
	}
	public String getExtra_config() {
		return extra_config;
	}
	public void setExtra_config(String extra_config) {
		this.extra_config = extra_config;
	}
	public Timestamp getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(Timestamp time_stamp) {
		this.time_stamp = time_stamp;
	}
	public int getRedisplay_ratio() {
		return redisplay_ratio;
	}
	public void setRedisplay_ratio(int redisplay_ratio) {
		this.redisplay_ratio = redisplay_ratio;
	}
	
}
