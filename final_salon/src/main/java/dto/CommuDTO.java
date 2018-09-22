package dto;

import java.util.Date;

public class CommuDTO {
	private int commuNum;
	private String nickname;
	private String id;
	private String email;
	private String subject;
	private Date regdate;
	private int readcount;
	private String content;
	private String Upload;
	private String category;
	private int replycnt; // 리플의 갯수
	private int readcnt;
	private PageDTO pagedto;

	public CommuDTO() {
		// TODO Auto-generated constructor stub
	}

	public PageDTO getPagedto() {
		return pagedto;
	}

	public void setPagedto(PageDTO pagedto) {
		this.pagedto = pagedto;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCommuNum() {
		return commuNum;
	}

	public void setCommuNum(int commuNum) {
		this.commuNum = commuNum;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpload() {
		return Upload;
	}

	public void setUpload(String upload) {
		Upload = upload;
	}

}// end class
