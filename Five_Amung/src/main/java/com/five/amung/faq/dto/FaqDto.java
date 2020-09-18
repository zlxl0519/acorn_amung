package com.five.amung.faq.dto;

public class FaqDto {
	private int num;
	private String qst;
	private String ans;
	private String category;
	private int startRowNum;
	private int endRowNum;
	
	public FaqDto() {}

	public FaqDto(int num, String qst, String ans, String category, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.qst = qst;
		this.ans = ans;
		this.category = category;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getQst() {
		return qst;
	}

	public void setQst(String qst) {
		this.qst = qst;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	
}
