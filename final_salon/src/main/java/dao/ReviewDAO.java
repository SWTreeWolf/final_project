package dao;

import java.util.HashMap;
import java.util.List;

import dto.PageDTO;
import dto.ReviewDTO;

public interface ReviewDAO {
	public List<ReviewDTO> list(int code,PageDTO pdto);
	public ReviewDTO content(int num);
	public void insert(ReviewDTO dto); //글 인서트
	public int count(int goods_code);
	public void delete(HashMap<String, Integer> map);
	public void update(ReviewDTO dto);
}//end interface
