package classroomManagement.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IBoardService { //모든 service 하나로 묶어 주는 인터페이스
	
	//Controller의 요청 위임을 처리하는 메소드
	void executeService(HttpServletRequest request, HttpServletResponse response); //추상 메소드 -> override 필요
	
}
