package model;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;

@Service
public class Cart {
	@Autowired
	private CartDao cartDao;
	private LinkedList<String> codeList = new LinkedList<String>();
	private LinkedList<Integer> numList = new LinkedList<Integer>();
	private String id;
	
	public void setCodeList(int index, String code) {
		this.codeList.add(index, code);
	}
	public void setNumList(int index, Integer num) {
		this.numList.add(index, num);
	}
	public Cart() {}
	public Cart(String id) {this.id = id;}
	public LinkedList<String> getCodeList() {
		return codeList;
	}
	public LinkedList<Integer> getNumList() {
		return numList;
	}
	public String getId() {
		return id;
	}
	public void deleteDB(String id) {
	}
	public List<CartItem> getCart(String id){
		return this.cartDao.selectCart(id);
	}
	
	public void saveDB() {
//		Crud crud = new Crud();
		for(int i=0; i<codeList.size(); i++) {
			String code = codeList.get(i);
			Integer num = numList.get(i);
			CartItem item = new CartItem();
			item.setId(id); item.setCode(code); item.setNum(num);
//			item.setSeqno(crud.getMaxSeqnoCart()+1);
//			crud.putCart(item);
		}
	}
	
	public void deleteItem(String code, String id) {
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(code)) {
				codeList.remove(i);
				numList.remove(i);
				CartItem item = new CartItem();
				item.setId(id); item.setCode(code);
				cartDao.deleteCart(item);
				return;
			}
		}
	}
	public void modifyItem(String code, int num, String id) {
		for(int i=0; i < codeList.size(); i++) {
			if(codeList.get(i).equals(code)) {
				numList.set(i, num);
				updateCart(code, num, id);
				return;
			}
		}
	}
	private void updateCart(String code,int num,String id) {
		CartItem item = new CartItem();
		item.setCode(code); item.setNum(num); item.setId(id);
		cartDao.updateCart(item);//DB에서 update
	}
	public void addCart(String code, int num, String id) {
		this.id = id;//계정을 저장
		for(int i=0;i<codeList.size();i++) {
			if(codeList.get(i).equals(code)) {
				numList.set(i, numList.get(i)+num);
				updateCart(code,numList.get(i),id);//DB에서 변경
				return;
			}
		}
		codeList.add(code); numList.add(num);
		insertCart(code,num,id);//DB에 저장
	}
	private void insertCart(String code,int num, String id) {
		Integer seqno=cartDao.getMaxCartId();//일련번호검색
		if(seqno == null) seqno = 1;
		else seqno = seqno + 1;
		CartItem item = new CartItem();
		item.setSeqno(seqno); item.setCode(code);
		item.setNum(num); item.setId(id);
		cartDao.insertCart(item);//DB에 저장
	}
}









