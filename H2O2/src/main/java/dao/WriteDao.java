package dao;

import java.util.List;

import model.Bbs;
import model.Condition;
import model.Writing;

public interface WriteDao {
	Integer getMaxId();
	void putBBS(Bbs bbs);
	
	Integer selectImageCount();//이미지게시글 갯수검색
	Integer selectRownum(Integer seqno);//글번호로 일련번호 검색
	
	void insertWriting(Writing writing);
	void updateWriting(Writing writing);
	void deleteWriting(Integer id);
	Writing getImageWriting(Integer id);
	Integer getMaxWritingId();
	List<Writing> getWriting(Condition pageNo);
	Integer selectMaxGroupId();
	void updateOrderNo(Writing writing);
}












