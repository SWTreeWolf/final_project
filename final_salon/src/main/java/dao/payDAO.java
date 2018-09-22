package dao;

import java.util.HashMap;
import java.util.List;

import dto.PayDTO;

public interface payDAO {
	public int payNum();
	public void payAdd(PayDTO dto);
	public void cartDelete(int cart_num);
	public void opt_Del(PayDTO dto);
	public void no_Opt_Del(PayDTO dto);
	public void opt_sel_up(PayDTO dto);
	public void prod_sel_up(PayDTO dto);
	public void mem_tot_price(PayDTO dto);
	public int mem_tot(PayDTO dto);
	public void mem_grade(HashMap<String,String> map);
	public void add_point(HashMap<Object,Object> map);
	public int recode_num(HashMap<String, String> map);
	public List<PayDTO> recode_pay_list(HashMap<String, Object> map);
	public void update_pay_list(HashMap<String, Object> map);
	public List<PayDTO> recode_pay(HashMap<String, String> map);
}
