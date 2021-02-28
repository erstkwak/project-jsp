package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;
import member.vo.MemberVO;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	
	MemberDAO memberDAO = null;

	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = null;
		String action  = request.getPathInfo();

		System.out.println("[액션] " + action);
		
// listMembers.do
		if (action == null || action.equals("/listMembers.do")) {
			List<MemberVO> membersList = memberDAO.listMembers();
			
			request.setAttribute("membersList", membersList);
			
			forward = "/view/member/listMembers.jsp";
		}
		
// addMember.do
		else if (action.equals("/addMember.do")) {
			String id       = request.getParameter("id"      );
			String pwd      = request.getParameter("pwd"     );
			String nickname = request.getParameter("nickname");
			String email    = request.getParameter("email"   );
			MemberVO memberVO = new MemberVO(id, pwd, nickname, email);
			
			memberDAO.addMember(memberVO);
			
			forward = "/member/loginMember.do";
		}
		
// addMemberForm.do		
		else if (action.equals("/addMemberForm.do")) {
			forward = "/view/member/addMemberForm.jsp";
		}
		
// modMember.do		
		else if (action.equals("/modMember.do")) {
		     String id       = request.getParameter("id"      );
		     String pwd      = request.getParameter("pwd"     );
		     String nickname = request.getParameter("nickname");
	         String email    = request.getParameter("email"   );
		     MemberVO memberVO = new MemberVO(id, pwd, nickname, email);
		     
		     memberDAO.modMember(memberVO);
		     
		     forward ="/member/listMembers.do";
		}
		
// modMemberForm.do
		else if (action.equals("/modMemberForm.do")) {
			String id = request.getParameter("id");
			
			MemberVO memInfo = memberDAO.findMember(id);
			
			request.setAttribute("memInfo", memInfo);
			
			forward = "/view/member/modMemberForm.jsp";
		}
		
// delMember.do		
		else if (action.equals("/delMember.do")) {
		     String id = request.getParameter("id");
		     
		     memberDAO.delMember(id);
		     
		     forward = "/member/listMembers.do";
		}
		
// loginMember.do
		else if (action.equals("/loginMember.do")) {
			String id  = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			MemberVO memberVO = new MemberVO();
			memberVO.setId (id);
			memberVO.setPwd(pwd);
			
			memberDAO = new MemberDAO();
			
			boolean result = memberDAO.isExisted(memberVO);
			
			if (result) {
				HttpSession session = request.getSession();
				session.setAttribute("isLogon", true);
				session.setAttribute("login_id", id);
				session.setAttribute("login_pwd", pwd);
				
				forward = "/index.jsp";
			}
			else {
				forward = "/view/member/loginMemberForm.jsp";
			}
		}
		
// loginMemberForm.do
		else if (action.equals("/loginMemberForm.do")) {
			forward = "/view/member/loginMemberForm.jsp";
		}

// logoutMember.do
		else if (action.equals("/logoutMember.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			forward = "/index.jsp";
		}
		
// adminPage.do
		else if (action.equals("/adminPage.do")) {
			forward = "/view/member/adminPage.jsp";
		}

// 나머지 요청	
		else {
			
			forward = "/index.jsp";
		}
		
		request.getRequestDispatcher(forward).forward(request, response);
	}

}