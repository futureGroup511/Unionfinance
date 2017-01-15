package com.future.domain;
/**
 * 工会实体
 * @author 牛洧鹏
 *
 */
public class Union {
	private Integer un_id;
	private String un_name; //工会名称
	private String un_redundancy;// 冗余字段
	public Integer getUn_id() {
		return un_id;
	}
	public void setUn_id(Integer un_id) {
		this.un_id = un_id;
	}
	public String getUn_name() {
		return un_name;
	}
	public void setUn_name(String un_name) {
		this.un_name = un_name;
	}
	public String getUn_redundancy() {
		return un_redundancy;
	}
	public void setUn_redundancy(String un_redundancy) {
		this.un_redundancy = un_redundancy;
	}
	
	
	
}
