package guest.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.dao.GuestbookDao;
import guest.vo.GuestbookVo;
import guest.base.Action;

public class GuestbookWrite implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 정보로 저장
		// guestbook_id, guestbook_password, guestbook_content
		response.setCharacterEncoding("utf-8");

		String guestbook_id     = request.getParameter("guestbook_id");		
		String guestbook_password = request.getParameter("guestbook_password");
		String guestbook_content  = request.getParameter("guestbook_content");

		GuestbookDao guestbookdao = new GuestbookDao();
		GuestbookVo  guestbookVo  = new GuestbookVo();

		guestbookVo.setGb_id(guestbook_id);
		guestbookVo.setGb_pass(guestbook_password);
		guestbookVo.setGb_con(guestbook_content);

		guestbookdao.guestbookInsert(guestbookVo);

		// 메뉴리스트로 이동(조회)한다
		String path = "/gbook?cmd=GUESTBOOKLIST";		
		request.getRequestDispatcher(path).forward(request, response);

	}
}
