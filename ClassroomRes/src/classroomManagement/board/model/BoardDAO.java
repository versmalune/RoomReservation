package classroomManagement.board.model;

import java.sql.*;
import java.util.*;

import classroomManagement.util.ConnProvider;
import classroomManagement.util.JdbcUtil;

public class BoardDAO { //singleton
	
	private static BoardDAO instance = new BoardDAO();
	
	private BoardDAO( ) {}
	
	public static BoardDAO getInstance() {
		if(instance != null) {
			return instance;
		}
		return instance;
	}
	
	/*�Խ��� �۵��� ������ DB�κ��� �ҷ��� �޼ҵ�*/
	public ArrayList<BoardVO> getList(int starttime, int endtime, String day){
		ArrayList<BoardVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT times.classno, times.day, starttimeok, endtimeok, people, projector, electricity, tv, computer FROM times\r\n" + 
				"LEFT JOIN reservation on times.classno = reservation.classno AND times.starttimeok = reservation.starttime AND times.endtimeok = reservation.endtime\r\n" + 
				"WHERE resno IS NULL\r\n" + 
				"AND starttimeok = ? AND endtimeok = ? AND times.day = ?;";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, starttime);
			pstmt.setInt(2, endtime);
			pstmt.setString(3, day);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String classno = rs.getString("classno");
				String dayok = rs.getString("day");
				int people = rs.getInt("people");
				String projector = rs.getString("projector");
				String electricity = rs.getString("electricity");
				String tv = rs.getString("tv");
				String computer = rs.getString("computer");
				int starttimeok = rs.getInt("starttimeok");
				int endtimeok = rs.getInt("endtimeok");
				
				BoardVO vo = new BoardVO(classno, people, projector, electricity, tv, computer, dayok, starttimeok, endtimeok);
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}	
		return list;
	}	
	
	/*�۾��� ��û�� ���� ������ DB�� �����ϴ� �޼ҵ�*/
	public void write(String classno, String rday, String stdId, int starttime, int endtime) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO reservation (classno, rday, stdId, starttime, endtime) VALUES (?,?,?,?,?);\r\n" + 
				"";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, classno);
			pstmt.setString(2, rday);
			pstmt.setString(3, stdId);
			pstmt.setInt(4, starttime);
			pstmt.setInt(5, endtime);
			
			pstmt.executeUpdate();
			System.out.println("INSERT COMPLETE");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	/*�Խñ� ���� Ȯ�� �޼ҵ�*/
	public BoardVO contentView(String strId) {
		
		upHit(strId); //�� ���� ���� �ִ� ���ÿ� upHit() ȣ�� -> ��ȸ�� �ø�
		
		BoardVO vo = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where board_id = ?";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(strId));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int bId = rs.getInt("board_id");
				String bName = rs.getString("board_name");
				String bTitle = rs.getString("board_title");
				String bContent = rs.getString("board_content");
				bContent = bContent.replaceAll("\r\n", "<br>");
				bContent = bContent.replaceAll("\u0020", "&nbsp;");
				Timestamp bDate = rs.getTimestamp("board_date");
				int bHit = rs.getInt("board_hit");
				
				//vo = new BoardVO(bId, bName, bTitle, bContent, bDate, bHit);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}	
		
		return vo;
	}
	
	/*�� ���� Ŭ���� ������ ��ȸ�� 1 ��½�Ű�� �޼ҵ�*/
	private void upHit(String strId) { //�� �ȿ����� ���ϱ� private
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set board_hit = board_hit + 1 where board_id=?";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(strId));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();	
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
	}



	public void update(String bId, String bTitle, String bContent) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set board_title = ?, board_content = ? where board_id = ?";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setInt(3, Integer.parseInt(bId));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}

	public void delete(String bId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from board where board_id = ?";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bId));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);	
		}	
	}	
}


