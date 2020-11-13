package dao;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Bbs;
import model.Condition;
import model.Writing;
@Repository
public class WriteDaoImpl implements WriteDao {
	@Autowired
	private SqlSession session;
	public Integer selectImageCount() {
		return session.selectOne("mapper.uploadMapper.getTotalCnt");
	}
	public Integer selectRownum(Integer seqno) {
		return session.selectOne(
			"mapper.uploadMapper.selectRownum",seqno);
	}
	public void insertWriting(Writing writing) {
		session.insert("mapper.uploadMapper.putImageWriting", writing);
	}
	public void updateWriting(Writing writing) {
		session.update("mapper.uploadMapper.updateImage",writing);
	}
	public void deleteWriting(Integer id) {
		session.delete("mapper.uploadMapper.deleteImage",id);
	}
	public Writing getImageWriting(Integer id) {
		return session.selectOne("mapper.uploadMapper.getImage",id);
	}
	public Integer getMaxWritingId() {
		Integer max = session.selectOne("mapper.uploadMapper.getMaxId");
		if(max == null) max = 0;
		return max;
	}
	public List<Writing> getWriting(Condition pageNo) {
		return session.selectList(
				"mapper.uploadMapper.getImageList", pageNo);
	}
	public Integer selectMaxGroupId() {
		return session.selectOne("mapper.uploadMapper.getMaxId");
	}
	public void updateOrderNo(Writing writing) {
		session.update("mapper.uploadMapper.updateOrderNo",writing);
	}
	public Integer getMaxId() {
		return session.selectOne("mapper.usersMapper.getMaxSeqno");
	}
	public void putBBS(Bbs bbs) {
		Integer seqno = this.getMaxId();
		if(seqno == null) seqno = 0;
		bbs.setSeqno(seqno + 1);//글번호 설정
		Calendar today = Calendar.getInstance();//작성일을 위함
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH) + 1;
		int date=today.get(Calendar.DATE);
		String bbsDate=year+"/"+month+"/"+date;
		bbs.setBbs_date(bbsDate);//작성일 설정
		session.insert("mapper.usersMapper.putBBS", bbs);
	}
}





