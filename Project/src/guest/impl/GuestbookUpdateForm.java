package guest.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.base.Action;

public class GuestbookUpdateForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/guestbook/GuestbookUpdateForm.jsp";

		request.getRequestDispatcher(path).forward(request, response);

	}

}
