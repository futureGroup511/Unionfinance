package com.future.domain;
/**
 * �û�ʵ��
 * @author ţ���
 *
 */
public class User {
	private Integer user_id;
	private String user_num; //�˺�
	private String user_password;//����
	private String user_phonenumber; //�绰����
	private String user_name;
	private String user_redundancy; //�����ֶ�
	private Union user_union;  //����
	private Integer user_type;//�û����� 1���������Ա 2��֧������Ա 3����ͨ�û�
	
	
	public Integer getUser_type() {
		return user_type;
	}
	public void setUser_type(Integer user_type) {
		this.user_type = user_type;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	
	public String getUser_phonenumber() {
		return user_phonenumber;
	}
	public void setUser_phonenumber(String user_phonenumber) {
		this.user_phonenumber = user_phonenumber;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_redundancy() {
		return user_redundancy;
	}
	public void setUser_redundancy(String user_redundancy) {
		this.user_redundancy = user_redundancy;
	}
	public Union getUser_union() {
		return user_union;
	}
	public void setUser_union(Union user_union) {
		this.user_union = user_union;
	}
	
	
}
