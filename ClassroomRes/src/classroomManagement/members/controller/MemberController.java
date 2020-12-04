package classroomManagement.members.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classroomManagement.members.service.MembersAllService;

@WebServlet("*.hello")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		String view = null;
		
		if(com.equals("/member/membersAll.hello")) { //요청 처리 넘김
			MembersAllService service = new MembersAllService();
			service.getMembersAll(request, response);
			view = "/member/member_result.jsp";
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(view); //if-else 통해서 view 골라 주고 여기서 리다이렉팅
		dp.forward(request, response); //객체 유지하면서 보내 줌
	}

}
