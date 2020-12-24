package com.lottery.entity;

public class Wining {
	private int sumMembers;
	private String winingMembers;
	private String winingLevels;
	public int getSumMembers() {
		return sumMembers;
	}
	public void setSumMembers(int sumMembers) {
		this.sumMembers = sumMembers;
	}
	public String getWiningMembers() {
		return winingMembers;
	}
	public void setWiningMembers(String winingMembers) {
		this.winingMembers = winingMembers;
	}
	public String getWiningLevels() {
		return winingLevels;
	}
	public void setWiningLevels(String winingLevels) {
		this.winingLevels = winingLevels;
	}
	public Wining() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Wining(int sumMembers, String winingMembers, String winingLevels) {
		super();
		this.sumMembers = sumMembers;
		this.winingMembers = winingMembers;
		this.winingLevels = winingLevels;
	}
}
