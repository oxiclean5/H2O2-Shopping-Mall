package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	@RequestMapping(value="/logout/template.html")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();//세션을 무효화
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject("BODY","logoutResult.jsp");
		return mav;
	}
}









