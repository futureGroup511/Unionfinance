package com.future.domain;

import java.util.Date;

/**
 * ֧����¼
 * @author ţ���
 *
 */
public class ExpenditureRecord {
	private Integer er_id;//��¼id
	private Date er_date;//ʱ��
	private Entry er_entry; //��Ŀ
	private Integer er_money; //��Ǯ
	private String er_accour_repour;//������
	private User er_user;
	public Integer getEr_id() {
		return er_id;
	}
	public void setEr_id(Integer er_id) {
		this.er_id = er_id;
	}
	public Date getEr_date() {
		return er_date;
	}
	public void setEr_date(Date er_date) {
		this.er_date = er_date;
	}
	public Entry getEr_entry() {
		return er_entry;
	}
	public void setEr_entry(Entry er_entry) {
		this.er_entry = er_entry;
	}
	public Integer getEr_money() {
		return er_money;
	}
	public void setEr_money(Integer er_money) {
		this.er_money = er_money;
	}
	public String getEr_accour_repour() {
		return er_accour_repour;
	}
	public void setEr_accour_repour(String er_accour_repour) {
		this.er_accour_repour = er_accour_repour;
	}
	public User getEr_user() {
		return er_user;
	}
	public void setEr_user(User er_user) {
		this.er_user = er_user;
	}
	
	
	
}
