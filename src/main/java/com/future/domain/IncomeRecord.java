package com.future.domain;

import java.util.Date;

/**
 * �����¼
 * @author ţ���
 *
 */
public class IncomeRecord {
	private Integer ir_id; //��¼id
	private Date ir_date;  //ʱ��
	private Entry ir_entry; //��Ŀ����
	private Double ir_money;//���
	private User ir_user; //����Ա��֧����
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
