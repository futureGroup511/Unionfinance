package com.future.domain;

import java.util.Date;

/**
 * @author 牛洧鹏
 */
public class IncomeRecord {
	private Integer ir_id; //id
	private Date ir_date;  //时间
	private Entry ir_entry; //条目
	private Double ir_money;//金额
	private User ir_user; //拨款人
	private Union ir_union; //公会
	private String ir_redundancy;//备注
	public Integer getIr_id() {
		return ir_id;
	}
	public void setIr_id(Integer ir_id) {
		this.ir_id = ir_id;
	}
	public Date getIr_date() {
		return ir_date;
	}
	public void setIr_date(Date ir_date) {
		this.ir_date = ir_date;
	}
	public Entry getIr_entry() {
		return ir_entry;
	}
	public void setIr_entry(Entry ir_entry) {
		this.ir_entry = ir_entry;
	}
	
	public Double getIr_money() {
		return ir_money;
	}
	public void setIr_money(Double ir_money) {
		this.ir_money = ir_money;
	}
	public User getIr_user() {
		return ir_user;
	}
	public void setIr_user(User ir_user) {
		this.ir_user = ir_user;
	}

	public static IncomeRecord newInstance(){return new IncomeRecord();}

	public Union getIr_union() {
		return ir_union;
	}

	public void setIr_union(Union ir_union) {
		this.ir_union = ir_union;
	}

	public String getIr_redundancy() {
		return ir_redundancy;
	}

	public void setIr_redundancy(String ir_redundancy) {
		this.ir_redundancy = ir_redundancy;
	}
}
