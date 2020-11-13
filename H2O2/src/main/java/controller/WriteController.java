package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.WriteDao;
import model.Condition;
import model.Custom_info;
import model.Writing;

@Controller
public class WriteController {
	@Autowired
	private WriteDao writeDao;
	
	@RequestMapping(value="/write/writeReplyForm.html")
	public ModelAndView replyForm(Integer id, Integer parentid,
			Integer groupid) {
		ModelAndView mav = new ModelAndView("home/template");
		Writing original=writeDao.getImageWriting(id);//원글검색
		original.setContent(null);//답글을 위해 지운다.
		original.setWriter_name(null);//답글을 위해 지운다.
		original.setEmail(null);//답글을 위해 지운다.
		original.setGroup_id(groupid);
		original.setParent_id(parentid);
		mav.addObject("writing",original);
		mav.addObject("title","RE]"+original.getTitle());
		mav.addObject("BODY","writeForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/write/updateDo.html")
	public ModelAndView modifyDo(Writing writing,HttpSession session) {
		Writing old=writeDao.getImageWriting(
				writing.getWriting_id());//게시글 검색
		ModelAndView mav = new ModelAndView("home/template");
		if(old.getPassword().equals(writing.getPassword())) {
			//암호가 일치하는 경우
			MultipartFile multiFile=writing.getImage();//파일수신
			String fileName=multiFile.getOriginalFilename();
			if(fileName.equals("")) {//이미지변경이 없는경우
				writing.setImage_name(old.getImage_name());
			}else {//새로운 이미지를 선택한 경우
				String path=null;OutputStream os=null;
				ServletContext ctx = session.getServletContext();
				path=ctx.getRealPath("/upload/"+fileName);
				try {
					os=new FileOutputStream(path);
					BufferedInputStream bis = 
						new BufferedInputStream(
							multiFile.getInputStream());
					byte[] buffer = new byte[8106];
					int read = 0;
					while( (read=bis.read(buffer))>0) {
						os.write(buffer,0,read);
					}
					if(os!=null) os.close();
				}catch(Exception e) {	}
				writing.setImage_name(fileName);//새이름설정
			}
			writeDao.updateWriting(writing);//DB에서 변경
			mav.addObject("BODY","updateResult.jsp?seq="+
					writing.getWriting_id());
		}else {//암호가 일치하지 않는 경우
			mav.addObject("BODY","updateResult.jsp?id="+
					writing.getWriting_id());
		}
		return mav;
	}
	
	@RequestMapping(value="/write/modify.html")
	public ModelAndView modify(Integer id) {
		ModelAndView mav = new ModelAndView("home/template");
		Writing writing=writeDao.getImageWriting(id);
		mav.addObject(writing);
		mav.addObject("BODY","updateForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/write/deleteDo.html")
	public ModelAndView deleteDo(Writing writing) {
		Writing old = writeDao.getImageWriting(
				writing.getWriting_id());//게시글검색
		ModelAndView mav = new ModelAndView("home/template");
		if(writing.getPassword().equals(old.getPassword())) {
		//암호가 일치하는 경우	
			writeDao.deleteWriting(writing.getWriting_id());//DB에서삭제
			mav.addObject("BODY","deleteResult.jsp");
		}else {//암호가 일치하지 않은 경우
			mav.addObject("BODY","deleteResult.jsp?id="+
					writing.getWriting_id());
		}
		return mav;
	}
	
	@RequestMapping(value="/write/delete.html")
	public ModelAndView delete(Integer id) {
		ModelAndView mav = new ModelAndView("home/template");
		Writing writing = writeDao.getImageWriting(id);//게시글검색
		mav.addObject(writing);
		mav.addObject("BODY","deleteForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/write/write.html")
	public ModelAndView write(@Valid Writing writing,
		BindingResult br, HttpSession session,
		Integer order_no, Integer group_id, Integer parent_id) {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("home/template");
			mav.addObject("BODY","writeForm.jsp");
			return mav;
		}
		MultipartFile multiFile = writing.getImage();
		String fileName=null; String path=null; 
		OutputStream os=null;
		if(multiFile != null) {
			fileName = multiFile.getOriginalFilename();
			ServletContext ctx=session.getServletContext();
			path=ctx.getRealPath("/upload/"+fileName);
			System.out.println("업로드경로:"+path);
			try {
				os=new FileOutputStream(path);
				BufferedInputStream bis = 
					new BufferedInputStream(
						multiFile.getInputStream());
				byte[] buffer = new byte[8156];
				int read = 0;
				while((read = bis.read(buffer)) > 0) {
					os.write(buffer, 0, read);
				}
			}catch(Exception e) {
				
			}
			writing.setImage_name(fileName);//파일이름 설정
		}
		Integer maxId=writeDao.getMaxWritingId();//DB에서 최대 글번호 검색
		if(writing.getParent_id()== null) {//원글인 경우
			writing.setParent_id(0);
			writing.setOrder_no(0);
			//DB에서 최대 그룹번호 검색
			Integer gId=writeDao.selectMaxGroupId();
			if(gId == null) gId = 0;
			writing.setGroup_id(gId);
		}else {//답글인 경우
			writing.setParent_id(parent_id);
			writing.setGroup_id(group_id);
			writing.setOrder_no(order_no);
			writeDao.updateOrderNo(writing);//DB에서 순서번호 변경
		}
		writing.setWriting_id(maxId + 1);//글번호 설정
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		int date = today.get(Calendar.DATE);
		String registerDate=year+"/"+month+"/"+date;
		writing.setRegister_date(registerDate);//작성일설정
		writeDao.insertWriting(writing);//DB에 삽입
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject("BODY","writeResult.jsp?SEQNO="+(maxId+1));
		return mav;
	}
	
	@RequestMapping(value="/write/writeList.html")
	public ModelAndView list(Integer SEQNO, Integer PAGE_NUM) {
		if(PAGE_NUM==null) PAGE_NUM = 1;
		ModelAndView mav = new ModelAndView("home/template");
		if(SEQNO != null) {
			int rownum=writeDao.selectRownum(SEQNO);//글번호로 일련번호 검색
			int page = rownum / 5;
			if(rownum % 5 != 0) page++;
			PAGE_NUM = page;//페이지 번호 설정
		}
		int currentPage = PAGE_NUM; int totalPageCount = 0;
		int startRow = 0; int endRow = 0;
		int count = writeDao.selectImageCount();//이미지 게시글의 갯수 검색
		if(count > 0) {
			totalPageCount = count / 5;
			if(count % 5 > 0) totalPageCount++;
			startRow = (currentPage -1)*5 + 1;
			endRow = currentPage * 5;
			if(endRow > count) endRow = count;
		}
		Condition c = new Condition();
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Writing> writeList = writeDao.getWriting(c);//글검색
		mav.addObject("LIST",writeList); 
		mav.addObject("count",count);
		mav.addObject("startRow",startRow);
		mav.addObject("endRow",endRow);
		mav.addObject("currentPage",currentPage);
		mav.addObject("pageCount",totalPageCount);
		mav.addObject("BODY","imageListView.jsp");
		return mav;
	}
	
	@RequestMapping(value="/write/writeForm.html")
	public ModelAndView form(HttpSession session) {
		String id=(String)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("home/template");
		if(id == null) {
			mav.addObject("NOLOGIN","yes");
			mav.addObject("guest",new Custom_info());
			mav.addObject("BODY","nologin.jsp");
		}else {
			mav.addObject("BODY","writeForm.jsp");
			mav.addObject(new Writing());
		}
		return mav;
	}
}










