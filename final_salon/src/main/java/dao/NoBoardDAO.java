package dao;

import java.util.List;

import dto.NoBoardDTO;
import dto.PageDTO;

public interface NoBoardDAO {
	public void insert(NoBoardDTO dto);
	public List<NoBoardDTO> listNo(PageDTO pv);
	public int countdata();
	public NoBoardDTO content(int num);
	public void readCounter(int num);
	public void update( NoBoardDTO dto);
	public void delete(int num);
} 
