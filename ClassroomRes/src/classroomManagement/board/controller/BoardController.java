package classroomManagement.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classroomManagement.board.service.BoardWriteService;
import classroomManagement.board.service.BoardSearchService;
import classroomManagement.board.service.IBoardService;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardController() {
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
		
		request.setCharacterEncoding("utf-8");
		
		IBoardService service = null;
		String view = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);
		if (com.equals("/board/find.board")) {
			System.out.println("SEARCH CALLED");
			view = "/board/board_search.jsp";
			
		} else if(com.equals("/board/write.board")) {
			System.out.println("WRITE.BOARD CALLED");
			service = new BoardWriteService();
			service.executeService(request, response);
			view = "/board/board_search.jsp";	

		}  else if(com.equals("/board/search.board")) {
			System.out.println("CALLED!");
			service = new BoardSearchService();
			service.executeService(request, response);
			System.out.println("CALLED 2!");
			view = "/board/board_list.jsp";
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(view);
		dp.forward(request, response);
		
	}
}
