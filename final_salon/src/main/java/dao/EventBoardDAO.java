package dao;

import java.util.List;

import dto.EventBoardDTO;
import dto.PageDTO;

public interface EventBoardDAO {
	public EventBoardDTO content(int Event_num);
	public void save(EventBoardDTO dto);	
	public List<EventBoardDTO> eventList();
	public List<EventBoardDTO> eventListb(PageDTO pv);
	public int countdata();
	public void update(EventBoardDTO dto);
	public void delete(int num);
}
