package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// request.setCharacterEncoding("utf-8");
		// response.setContentType("text/html); charset=utf-8");
		
		String forward = null;
		
		String action = request.getPathInfo();
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
			
			request.setAttribute("msg", "addMember");
			
			forward = "/member/listMembers.do";
		}
		
		else if (action.equals("/addMemberForm.do")) {
			forward = "/view/member/addMemberForm.jsp";
		}
		
		else if (action.equals("/modMember.do")) {
		     String id       = request.getParameter("id");
		     String pwd      = request.getParameter("pwd");
		     String nickname = request.getParameter("nickname");
	         String email    = request.getParameter("email");
	         
		     MemberVO memberVO = new MemberVO(id, pwd, nickname, email);
		     
		     memberDAO.modMember(memberVO);
		     
		     request.setAttribute("msg", "modMember");
		     
		     forward ="/member/listMembers.do";
		}
		
		else if (action.equals("/modMemberForm.do")) {
			String id = request.getParameter("id");
			
			MemberVO memInfo = memberDAO.findMember(id);
			request.setAttribute("memInfo", memInfo);
			
			forward = "/view/member/modMemberForm.jsp";
		}
		
		else if (action.equals("/delMember.do")) {
		     String id = request.getParameter("id");
		     memberDAO.delMember(id);
		     request.setAttribute("msg", "delMember");
		     forward = "/member/listMembers.do";
		}
		
		else {
			List<MemberVO> membersList = memberDAO.listMembers();
			request.setAttribute("membersList", membersList);
			forward = "/view/member/listMembers.jsp";
		}
		
		request.getRequestDispatcher(forward).forward(request, response);
	}

}