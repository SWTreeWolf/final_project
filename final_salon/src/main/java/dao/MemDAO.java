package dao;

import java.util.HashMap;
import java.util.List;

import dto.MemDTO;

public interface MemDAO {
	public MemDTO searchMem(MemDTO dto);
	public void salonInsMem(MemDTO dto);
	public List<MemDTO> overlapMem(MemDTO dto);
	public MemDTO compareMem(HashMap<String, String> map);
	public void deleteMem(HashMap<String, String> map);
	public void updateMem(MemDTO dto);
	public MemDTO referenceMem(MemDTO dto);
	public MemDTO checkpassword(MemDTO dto);
	public int mypoint(String id);
	public void decreasepoint(MemDTO dto);
	public List<MemDTO> memList(HashMap<String, Object> hash);
	public int MemCount();
	public void addPoint(MemDTO dto);
}
  