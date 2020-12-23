package com.lottery.entity;

public class Player {
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Player() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Player(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}	
}
