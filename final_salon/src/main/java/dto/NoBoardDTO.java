package dto;

import java.util.Date;


public class NoBoardDTO {

public NoBoardDTO() {
}
	
private int noNum;
private String noCate;
private String noTitle;
private String noContent;
private Date reg_date; 	
private int readcount;

 
public int getNoNum() {
	return noNum;
}
public void setNoNum(int noNum) {
	this.noNum = noNum;
}
public String getNoCate() {
	return noCate;
}
public void setNoCate(String noCate) {
	this.noCate = noCate;
}


public String getNoTitle() {
	return noTitle;
}
public void setNoTitle(String noTitle) {
	this.noTitle = noTitle;
}
public String getNoContent() {
	return noContent;
}
public void setNoContent(String noContent) {
	this.noContent = noContent;
}
public Date getReg_date() {
	return reg_date;
}
public void setReg_date(Date reg_date) {
	this.reg_date = reg_date;
}
public int getReadcount() {
	return readcount;
}
public void setReadcount(int readcount) {
	this.readcount = readcount;
} 

}
