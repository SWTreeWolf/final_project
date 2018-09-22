package dto;


import org.springframework.web.multipart.MultipartFile;

public class EventBoardDTO {
	private int event_num;
	private String event_name, event_mainpic, event_content;
	private String start_date;
	private String end_date; 
	private MultipartFile event_mainpic_file;
    public EventBoardDTO() {
		
	}
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_mainpic() {
		return event_mainpic;
	}
	public void setEvent_mainpic(String event_mainpic) {
		this.event_mainpic = event_mainpic;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	 
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public MultipartFile getEvent_mainpic_file() {
		return event_mainpic_file;
	}
	public void setEvent_mainpic_file(MultipartFile event_mainpic_file) {
		this.event_mainpic_file = event_mainpic_file;
	}

}
	
	