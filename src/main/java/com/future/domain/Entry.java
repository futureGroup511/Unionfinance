package com.future.domain;

/**
 * 条目
 */
public class Entry {
	private Integer en_id; //id
	private Integer en_type; //条目类型0拨款 1支出
	private String en_name;
	private String en_redundancy; //冗余
	public Integer getEn_id() {
		return en_id;
	}
	public void setEn_id(Integer en_id) {
		this.en_id = en_id;
	}
	public Integer getEn_type() {
		return en_type;
	}
	public void setEn_type(Integer en_type) {
		this.en_type = en_type;
	}
	public String getEn_redundancy() {
		return en_redundancy;
	}
	public void setEn_redundancy(String en_redundancy) {
		this.en_redundancy = en_redundancy;
	}

	public String getEn_name() {
		return en_name;
	}

	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}

	public static Entry newInstance(){
		return new Entry();
	}

	@Override
	public String toString() {
		return "Entry{" +
				"en_id=" + en_id +
				", en_type=" + en_type +
				", en_name='" + en_name + '\'' +
				", en_redundancy='" + en_redundancy + '\'' +
				'}';
	}
}

