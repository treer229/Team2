package kr.or.bit.dto;
/*
작업일자 : 2019-05-08
작업자 :    권순조
작업내용 : 여행리뷰 댓글 dto 작성
*/
public class TravelReview_Comments {
	private String comment_num;
	private String id;
	private String tr_num;
	private String content;
	private String comment_date;
	
	public String getComment_num() {
		return comment_num;
	}
	public void setComment_num(String comment_num) {
		this.comment_num = comment_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTr_num() {
		return tr_num;
	}
	public void setTr_num(String tr_num) {
		this.tr_num = tr_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	
	@Override
	public String toString() {
		return "TravelReview_Comments [comment_num=" + comment_num + ", id=" + id + ", tr_num=" + tr_num + ", content="
				+ content + ", comment_date=" + comment_date + "]";
	}
	
	
}
