package dto;

import java.util.List;

public class replypageDTO {
	private PageDTO pdto;
	private List<commureplyDTO> cdto;
	
	public replypageDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public PageDTO getPdto() {
		return pdto;
	}
	public void setPdto(PageDTO pdto) {
		this.pdto = pdto;
	}
	public List<commureplyDTO> getCdto() {
		return cdto;
	}
	public void setCdto(List<commureplyDTO> cdto) {
		this.cdto = cdto;
	}

}//end class
