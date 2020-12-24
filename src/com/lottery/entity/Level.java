package com.lottery.entity;

public class Level {
	private int level1;
	private int level2;
	private int level3;
	public Level() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Level(int level1, int level2, int level3) {
		super();
		this.level1 = level1;
		this.level2 = level2;
		this.level3 = level3;
	}
	public int getLevel1() {
		return level1;
	}
	public void setLevel1(int level1) {
		this.level1 = level1;
	}
	public int getLevel2() {
		return level2;
	}
	public void setLevel2(int level2) {
		this.level2 = level2;
	}
	public int getLevel3() {
		return level3;
	}
	public void setLevel3(int level3) {
		this.level3 = level3;
	}
}
