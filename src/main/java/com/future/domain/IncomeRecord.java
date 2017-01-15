package com.future.domain;

import java.util.Date;

/**
 * 收入记录
 * @author 牛洧鹏
 *
 */
public class IncomeRecord {
	private Integer ir_id; //记录id
	private Date ir_date;  //时间
	private Entry ir_entry; //条目类型
	private Double ir_money;//金额
	private User ir_user; //管理员（支出）
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
	
}
