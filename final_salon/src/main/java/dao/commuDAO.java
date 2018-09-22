package dao;

import java.util.List;

import dto.CommuDTO;
import dto.PageDTO;

public interface commuDAO {
	public List<CommuDTO> toplist();
	public CommuDTO numcontent(int commuNum);
	public void insert(CommuDTO dto);
	public List<CommuDTO> commulist(PageDTO pdto);
	public void delete(int commuNum); /*글삭제*/
	public int replycnt(int commuNum);
	public void readcount(int commuNum);
	public int count();
	public void update(CommuDTO cdto);
	public List<CommuDTO> search(String subject);
	public int searchlistCnt(String subject);
	public List<CommuDTO> skin(PageDTO pdto);
	public List<CommuDTO> makeUp(PageDTO pdto);
	public List<CommuDTO> Product(PageDTO pdto);
	public List<CommuDTO> etc(PageDTO pdto);
	public int skincnt();
	public int makeupcnt();
	public int productcnt();
	public int etccnt();
}//end interface//
