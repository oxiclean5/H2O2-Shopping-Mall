package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ItemCatalog;
import model.Custom_info;
import model.Item;

@Controller
public class ProductController {
	@Autowired
	private ItemCatalog itemCatalog;
	@RequestMapping(value="/product/entry.html")
	public ModelAndView entry(@Valid Item item, BindingResult br,
			HttpSession session) {
		ModelAndView mav = new ModelAndView("home/template");
		if(br.hasErrors()) {
			mav.addObject("BODY","inputItem.jsp");
			return mav;
		}
		String id=(String)session.getAttribute("loginUser");
		if(id == null) {//로그인을 안 한경우
			mav.addObject("NOITEM","yes");
			mav.addObject("guest", new Custom_info());
			mav.addObject("BODY","nologin.jsp");
			return mav;
		}else {//로그인을 한 경우
			itemCatalog.putItem(item);//DB에 상품정보 삽입
			//페이지를 redirect로 바꾼다.
			return new ModelAndView("redirect:/read/product.html");
		}
	}
	
	@RequestMapping(value="/product/open.html")
	public ModelAndView open() {
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject(new Item());//객체 주입
		mav.addObject("BODY","inputItem.jsp");
		return mav;
	}
}










