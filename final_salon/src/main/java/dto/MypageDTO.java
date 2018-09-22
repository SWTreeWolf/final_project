package dto;

import java.util.List;

public class MypageDTO {
	private List<ReviewDTO> rlist;
	private List<CommuDTO> clist;
	private PageDTO pdto;
	
	
	public MypageDTO(){
		
	}

	
	
	public List<CommuDTO> getClist() {
		return clist;
	}



	public void setClist(List<CommuDTO> clist) {
		this.clist = clist;
	}



	public List<ReviewDTO> getRlist() {
		return rlist;
	}

	public void setRlist(List<ReviewDTO> rlist) {
		this.rlist = rlist;
	}

	public PageDTO getPdto() {
		return pdto;
	}

	public void setPdto(PageDTO pdto) {
		this.pdto = pdto;
	}
	
	
}
