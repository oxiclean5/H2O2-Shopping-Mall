package dao;

import java.util.List;

import model.Bbs;

public interface ReadDao {
	List<Bbs> readBbs(Integer pageNo);//게시글 목록
	Integer getBbsCount();//게시글의 갯수
	Bbs getBbsDetail(Integer no);//게시글 상세
}












