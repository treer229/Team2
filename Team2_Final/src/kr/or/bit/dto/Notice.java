package kr.or.bit.dto;

public class Notice {
	/*
    작업일자 : 2019-05-08
    작업자 :    권순조
    작업내용 : 공지 dto 작성
    */
	private String notice_num;
	private String notice_title;
	private String content;
	private int views;
	private String created_date;
	private String id;
	
	public Notice() {
		
	}
	
	public Notice(String notice_num, String notice_title, String content, int views, String created_date, String id) {
		super();
		this.notice_num=notice_num;
		this.notice_title=notice_title;
		this.content=content;
		this.views=views;
		this.created_date=created_date;
		this.id=id;
	}

	public String getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(String notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Notice [notice_num=" + notice_num + ", notice_title=" + notice_title + ", content=" + content
				+ ", views=" + views + ", created_date=" + created_date  + ", id="
				+ id + "]";
	}

	

	
}