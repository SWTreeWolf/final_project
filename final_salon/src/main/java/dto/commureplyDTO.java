package dto;

import java.util.Date;

public class commureplyDTO {
	private int replyNum;
	private int commuNum;
	private String reply;
	private String replyWriter;
	private Date reRegdate;
	
	public commureplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getCommuNum() {
		return commuNum;
	}

	public void setCommuNum(int commuNum) {
		this.commuNum = commuNum;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public Date getReRegdate() {
		return reRegdate;
	}

	public void setReRegdate(Date reRegdate) {
		this.reRegdate = reRegdate;
	}
	
	

}//end commureply
