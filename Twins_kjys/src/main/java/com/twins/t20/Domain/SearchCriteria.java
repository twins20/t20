package com.twins.t20.Domain;


public class SearchCriteria extends Criteria{
	
	private int jbidx;
	private String jbcategory;
	private String searchType;
	private String keyword;
	
	public int getJbidx() {
		return jbidx;
	}
	public void setJbidx(int jbidx) {
		this.jbidx = jbidx;
	}
	public String getJbcategory() {
		return jbcategory;
	}
	public void setJbcategory(String jbcategory) {
		this.jbcategory = jbcategory;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [jbidx=" + jbidx + ", jbcategory=" + jbcategory + ", searchType=" + searchType
				+ ", keyword=" + keyword + "]";
	}
}
