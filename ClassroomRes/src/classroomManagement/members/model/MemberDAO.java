package classroomManagement.members.model;

import java.sql.*;
import java.util.*;

import classroomManagement.util.ConnProvider;
import classroomManagement.util.JdbcUtil;

public class MemberDAO { //Data Access Object
	
	//회원 관리 로직에 필요한 상수들 선언
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int JOIN_SUCCESS = 1;
	public static final int JOIN_FAIL = 0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL_PW = 0;
	public static final int LOGIN_FAIL_ID = -1;
	
	
	
	/*DAO 객체는 메모리 heap 영역에 1개만 존재해도 무방하기 때문에 싱글통 패턴을 적용하여 클래스를 디자인 -> 객체 1개만 생성되도록 함
	<싱글톤 패턴>
	1. 다른 클래스(외부)에서 객체를 생성할 수 없게 함: 생성자에 private 걸기
	2. 자기 클래스 내부에서 스스로 객체 생성
	3. 외부에서 객체 생성 요구할 시 public 메소드 통해서 2번에서 미리 만들어 둔 객체를 return*/
	
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {}

	public static MemberDAO getInstance() {
		return instance;
	}
	
	/*회원 가입 처리 메소드*/
	public int insertMember(MemberVO vo) {
		
		int regNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member (stdId, id, pw, name, email, phone) values (?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getStdId());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPw());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getPhone());
			
			int i = pstmt.executeUpdate();
			
			if (i == 1) {
				regNum = MemberDAO.JOIN_SUCCESS;
			} else {
				regNum = MemberDAO.JOIN_FAIL;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
		return regNum;
	}
	
	/*이미 가입된 회원인지 검증하는 메소드*/
	public int confirmId(String id) {
		
		int regNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from member where id = ?";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //그 id로 회원 가입 이미 되어 있는 경우
				regNum = MemberDAO.MEMBER_EXISTENT;
			} else {
				regNum = MemberDAO.MEMBER_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return regNum;
	}
	
	/*로그인 유효성 검증 메소드*/
	public int userCheck(String id, String pw) {
		int loginNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pw from member where id = ?";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) { //가입되어 있는 사람일 경우
				String dbPw = rs.getString("pw");
				if (dbPw.equals(pw)) {
					loginNum = MemberDAO.LOGIN_SUCCESS;
				} else {
					loginNum = MemberDAO.LOGIN_FAIL_PW;
				}
			} else { //가입되어 있지 않은 사람일 경우
				loginNum = MemberDAO.LOGIN_FAIL_ID;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return loginNum;
	}
	
	//회원의 정보를 가져오는 메소드
	public MemberVO getMember(String id) {
		MemberVO vo = new MemberVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	      
		String sql = "select * from member where id=?";
	      
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo.setStdId(rs.getString("stdId"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
	            vo.setName(rs.getString("name"));
	            vo.setEmail(rs.getString("email"));
	            vo.setPhone(rs.getString("phone"));
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

	//비밀번호를 변경하는 메서드
	public int changePassword(String id, String pw) {
		int updateNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
	      
		String sql = "update member set pw=? where id=?";
	      
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
	         
			pstmt.setString(1, pw);
			pstmt.setString(2, id);    
			updateNum = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}      
	      
		return updateNum;
	}
	
	//회원정보 수정을 처리하는 메소드
	public int updateMember(String email, String phone, String id) {
		int updateNum = 0;
		      
		Connection conn = null;
		PreparedStatement pstmt = null;
		      
		String sql = "UPDATE MEMBER SET EMAIL=?, PHONE=? WHERE ID=?";
		      
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
		         
			pstmt.setString(1, email);
			pstmt.setString(2, phone);
			pstmt.setString(3, id);
		         
			updateNum = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		return updateNum;
	}		
	
	//회원 탈퇴 처리 메소드
	public int deleteMember(String id) {
		
		int delNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from member where id = ?";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			delNum = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		return delNum;
	}
	
	//전체 회원 정보 조회 메소드
	public ArrayList<MemberVO> membersAll() {
		
		ArrayList<MemberVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member";
		
		try {
			conn = ConnProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString("stdId"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				
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
	
}