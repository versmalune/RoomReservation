package classroomManagement.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.text.*;

import classroomManagement.board.model.BoardDAO;

public class BoardWriteService implements IBoardService {

	@Override
	public void executeService(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("Board Write Service Called");

		String resclass = request.getParameter("resclass");
		System.out.println(resclass);
		
		String[] parts = resclass.split(","); //returns an array with the 2 parts
		String classno = parts[0];
		String rday = parts[3];
		int starttime = Integer.parseInt(parts[1]);
		int endtime = Integer.parseInt(parts[2]);
		System.out.println(starttime);
		System.out.println(endtime);
		System.out.println(rday);
		HttpSession s = request.getSession();
		String stdId = (String)s.getAttribute("stdId");
		System.out.println(stdId);


		System.out.println(starttime);
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.write(classno, rday, stdId, starttime, endtime);
	}
}