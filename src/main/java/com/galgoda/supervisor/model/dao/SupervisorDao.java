package com.galgoda.supervisor.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Option;
import com.galgoda.hotel.model.vo.Tag;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.vo.Terms;


import static com.galgoda.common.template.JDBCTemplate.*;
public class SupervisorDao {
	private Properties prop = new Properties();
	public SupervisorDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(SupervisorDao.class.getResource("/db/mappers/supervisor-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<Customer> selectUserList(Connection conn, PageInfo pi) {
		List<Customer> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Customer(rset.getInt("user_no")
						  , rset.getString("user_id")
						  , rset.getString("user_name")
						  , rset.getString("user_eng_name")
						  , rset.getString("user_pwd")
						  , rset.getString("birth_date")
						  , rset.getString("email")
						  , rset.getString("phone")
						  , rset.getString("zipcode")
						  , rset.getString("address")
						  , rset.getString("address_detail")
						  , rset.getString("etc")
						  , rset.getDate("regist_date")
						  , rset.getDate("modify_date")
						  , rset.getString("status")));
							
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
				
		return list;
	}
	public Customer selectUser(Connection conn, int userNo) {
		Customer user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new Customer(rset.getInt("user_no")
						  , rset.getString("user_id")
						  , rset.getString("user_name")
						  , rset.getString("user_eng_name")
						  , rset.getString("user_pwd")
						  , rset.getString("birth_date")
						  , rset.getString("email")
						  , rset.getString("phone")
						  , rset.getString("zipcode")
						  , rset.getString("address")
						  , rset.getString("address_detail")
						  , rset.getString("etc")
						  , rset.getDate("regist_date")
						  , rset.getDate("modify_date")
						  , rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return user;
	}
	public int updateUser(Connection conn, Customer user) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPhone());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getAddressDetail());
			pstmt.setString(6, user.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public List<Terms> selectTermsList(Connection conn) {
		List<Terms> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTermsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Terms(
							rset.getInt("terms_no")
						  ,	rset.getString("terms_title")
						  , rset.getString("terms_content")
						  , rset.getString("admin_id")
						  , rset.getString("notes")
						  , rset.getString("regist_date")
						  , rset.getString("modify_date")
						  , rset.getString("status")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public List<HotelUser> selectHotelList(Connection conn, PageInfo pi) {
		List<HotelUser> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HotelUser hotelUser = new HotelUser();
				hotelUser.setMemNo(rset.getInt("mem_no"));
				hotelUser.setMemName(rset.getString("mem_name"));
				hotelUser.setMemId(rset.getString("mem_id"));
				hotelUser.setHotelName(rset.getString("hotel_name"));
				hotelUser.setMemEmail(rset.getString("mem_email"));
				hotelUser.setMemPhone(rset.getString("mem_phone"));
				hotelUser.setHotelNo(rset.getInt("hotel_no"));
				hotelUser.setHotelAddress(rset.getString("hotel_address"));
				list.add(hotelUser);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int selectHotelListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	public int insertTerm(Connection conn, Terms t) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTerm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTermsTitle());
			pstmt.setString(2, t.getTermsContent());
			pstmt.setString(3, t.getAdminNo());
			pstmt.setString(4, t.getNotes());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertTermAt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTermAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getFileName());
			pstmt.setString(2, at.getFilePath());
			pstmt.setString(3, at.getOriginName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public Terms detailTerms(Connection conn, int termNo) {
		Terms t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				t = new Terms();
				t.setTermsNo(rset.getInt("terms_no"));
				t.setTermsTitle(rset.getString("terms_title"));
				t.setTermsContent(rset.getString("terms_content"));
				t.setAdminNo(rset.getString("admin_id"));
				t.setNotes(rset.getString("notes"));
				t.setModifyDate(rset.getString("modify_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return t;
	}
	public Attachment selectFile(Connection conn, int termNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment();
				at.setFileName(rset.getString("file_name"));
				at.setFileNo(rset.getInt("file_no"));
				at.setFilePath(rset.getString("file_path"));
				at.setRefNo(rset.getInt("ref_no"));
				at.setRefType(rset.getString("ref_type"));
				at.setStatus(rset.getString("status"));
				at.setOriginName(rset.getString("file_origin_name"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	public int updateTerm(Connection conn, Terms t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTerm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTermsTitle());
			pstmt.setString(2, t.getTermsContent());
			pstmt.setString(3, t.getNotes());
			pstmt.setInt(4, t.getTermsNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateTermAt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTermAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getFileName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertNewTermAt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewTermAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getFileName());
			pstmt.setString(3, at.getOriginName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteTerm(Connection conn, int termNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTerm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, termNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int selectUserListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	public int deleteUser(Connection conn, int userNo) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int selectCodeCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCodeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	public List<HotelUser> selectCodeList(Connection conn, PageInfo pi) {
		List<HotelUser> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCodeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HotelUser h = new HotelUser();
				h.setMemNo(rset.getInt("mem_no"));
				h.setMemName(rset.getString("mem_name"));
				h.setAuthentiCode(rset.getString("authenticode"));
				h.setHotelName(rset.getString("hotel_name"));
				list.add(h);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	public HotelUser selectCode(Connection conn, int memNo) {
		HotelUser code = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				code = new HotelUser();
				code.setMemName(rset.getString("mem_name"));
				code.setAuthentiCode(rset.getString("authenticode"));
				code.setHotelName(rset.getString("hotel_name"));
				code.setMemNo(rset.getInt("mem_no"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return code;
	}
	public int updateCode(Connection conn, HotelUser code) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code.getMemName());
			pstmt.setString(2, code.getAuthentiCode());
			pstmt.setString(3, code.getHotelName());
			pstmt.setInt(4, code.getMemNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteCode(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			result =pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertCode(Connection conn, HotelUser code) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code.getAuthentiCode());
			pstmt.setString(2, code.getHotelName());
			result =pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
	public List<Tag> selectTagList(Connection conn) {
		List<Tag> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTagList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Tag(
							rset.getInt("tag_no")
						  ,	rset.getString("tag_name")
						  , rset.getString("status")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public List<Option> selectOptionList(Connection conn) {
		List<Option> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOptionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Option(
							rset.getInt("op_no")
						  ,	rset.getString("op_name")
						  , rset.getString("status")
						));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int insertTag(Connection conn, String tagName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tagName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int updateTag(Connection conn, String tagName, String newTagName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newTagName);
			pstmt.setString(2, tagName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int deleteTag(Connection conn, String tagName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tagName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertOption(Connection conn, String name) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOption");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int updateOption(Connection conn, String originName, String newName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateOption");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newName);
			pstmt.setString(2, originName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public int deleteOption(Connection conn, String name) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteOption");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public Hotel detailHotel(Connection conn, int hotelNo) {
		Hotel h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				h = new Hotel(
							rset.getInt("hotel_no")
						  ,	rset.getString("hotel_name")
						  , rset.getString("hotel_address")
						  , rset.getString("hotel_detailadd")
						  , rset.getString("hotel_tel")
						  , rset.getString("hotel_site")
						  , rset.getInt("hotel_checkin")
						  , rset.getInt("hotel_checkout")
						  , rset.getString("hotel_detail")
						  , rset.getString("hotel_intro")
						  , rset.getString("refundpolicy")
						  , rset.getString("status")
						  , rset.getString("tag_no")
						  , rset.getString("img_path")
						  , rset.getInt("mem_no")
						);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return h;
	}
	public String hotelCount(Connection conn) {
		String hotelCount = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("hotelCount");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hotelCount = rset.getString("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hotelCount;
	}
	public String newInqCount(Connection conn) {
		String newInqCount = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT COUNT(*) COUNT FROM TB_INQ WHERE MODIFY_DATE >= sysdate - 1";
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				newInqCount = rset.getString("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return newInqCount;
	}
	public String termsCount(Connection conn) {
		String termsCount = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("termsCount");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				termsCount = rset.getString("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return termsCount;
	}
	public Hotel selectHotelForm(Connection conn, int hotelNo) {
		
		Hotel h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelForm");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				h = new Hotel();
				h.setHotelNo(rset.getInt("hotel_no"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setHotelAddress(rset.getString("hotel_address"));
				h.setHotelDetailAdd(rset.getString("hotel_detailadd"));
				h.setHotelTel(rset.getString("hotel_tel"));
				h.setHotelSite(rset.getString("hotel_site"));
				h.setHotelCheckin(rset.getInt("hotel_checkin"));
				h.setHotelCheckout(rset.getInt("hotel_checkout"));
				h.setHotelDetail(rset.getString("hotel_detail"));
				h.setHotelIntro(rset.getString("hotel_intro"));
				h.setRefundpolicy(rset.getString("refundpolicy"));
				h.setTagNo(rset.getString("tag_no"));
				h.setImgPath(rset.getString("img_path"));
				h.setMemNo(rset.getInt("mem_no"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return h;
	}
	public HotelUser selectMem(Connection conn, int memNo) {
		HotelUser mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new HotelUser(
							rset.getInt("mem_no")
						  ,	rset.getString("mem_id")
						  , rset.getString("mem_pwd")
						  , rset.getString("mem_name")
						  , rset.getString("mem_phone")
						  , rset.getString("mem_email")
						  , rset.getDate("regist_date")
						  , rset.getDate("modify_date")
						  , rset.getString("status")
						  , rset.getString("authenticode")
						  , rset.getString("hotel_name")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}
	public int updateMem(Connection conn, HotelUser mem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getMemName());
			pstmt.setString(2, mem.getMemPhone());
			pstmt.setString(3, mem.getMemEmail());
			pstmt.setInt(4, mem.getMemNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int deleteMem(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public int deleteHotel(Connection conn, int hotelNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public List<Hotel> searchHotelList(Connection conn, int type, String value) {
		List<Hotel> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		if(type==1) { // 1 호텔이름  2, 담당자 이름
			sql = prop.getProperty("searchHotelList");
		}else {
			sql = prop.getProperty("searchHotelList2");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, value);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Hotel h = new Hotel();
				h.setHotelNo(rset.getInt("hotel_no"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setHotelAddress(rset.getString("hotel_address"));
				h.setHotelDetailAdd(rset.getString("hotel_detailadd"));
				h.setHotelTel(rset.getString("hotel_tel"));
				h.setHotelSite(rset.getString("hotel_site"));
				h.setHotelCheckin(rset.getInt("hotel_checkin"));
				h.setHotelCheckout(rset.getInt("hotel_checkout"));
				h.setHotelDetail(rset.getString("hotel_detail"));
				h.setHotelIntro(rset.getString("hotel_intro"));
				h.setRefundpolicy(rset.getString("refundpolicy"));
				h.setTagNo(rset.getString("tag_no"));
				h.setImgPath(rset.getString("img_path"));
				h.setMemNo(rset.getInt("mem_no"));
				
				
				list.add(h);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
}
