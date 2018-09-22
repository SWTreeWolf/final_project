package dao;

import java.util.List;

import dto.FnqDTO;
import dto.PageDTO;

public interface FnqDAO {
	public void insert(FnqDTO dto);
	public FnqDTO content(int num);
	public List<FnqDTO> listfnq(PageDTO pv);
	public int countdata();
	public void delete(int num);
	public FnqDTO updateNum(int fnqNum);
	public void update( FnqDTO dto);
	
}
