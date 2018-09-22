package dao;

import java.util.List;

import dto.commureplyDTO;

public interface replyDAO {
	public void insertreply(commureplyDTO rdto);
	public List<commureplyDTO> commureplylist(int commuNum);

}//end interface()//
