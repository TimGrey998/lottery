package com.lottery.entity;

public class Prize {
	private int prizeId;
	private int level;
	private String prizeName;
	private String image;
	private String desc;
	public int getPrizeId() {
		return prizeId;
	}
	public void setPrizeId(int prizeId) {
		this.prizeId = prizeId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getPrizeName() {
		return prizeName;
	}
	public void setPrizeName(String prizeName) {
		this.prizeName = prizeName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Prize(int prizeId, int level, String prizeName, String image, String desc) {
		super();
		this.prizeId = prizeId;
		this.level = level;
		this.prizeName = prizeName;
		this.image = image;
		this.desc = desc;
	}
	public Prize() {
		super();
		// TODO Auto-generated constructor stub
	}
}
