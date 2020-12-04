package classroomManagement.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classroomManagement.board.model.BoardDAO;
import classroomManagement.board.model.BoardVO;

public class BoardSearchService implements IBoardService {

public void executeService(HttpServletRequest request, HttpServletResponse response) {
	
	int starttime = Integer.parseInt(request.getParameter("starttime"));
	int endtime = Integer.parseInt(request.getParameter("endtime"));
	String day = request.getParameter("day");
	System.out.println(starttime);
	System.out.println(endtime);
	System.out.println(day);
	
	
	BoardDAO dao = BoardDAO.getInstance();
	ArrayList<BoardVO> list = dao.getList(starttime, endtime, day);
	request.setAttribute("board_list", list);
	}

}
