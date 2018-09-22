package dao;
import dto.ImgcontentDTO;

public interface ImgDAO {
	public void upload(ImgcontentDTO dto);
	public ImgcontentDTO content(int num);	

}
