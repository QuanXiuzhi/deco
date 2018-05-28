package main_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.websocket.Session;

import main_vo.ImageVo;
import connection.OracleXEConnection;

public class ImageDao {
	
	StringBuffer sb=new StringBuffer();
	ResultSet rs=null;
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	/*select p.pt_title, i.img_temp1, p.pt_like, p.pt_hit
	from post p, image i
	where p.pt_no=i.pt_no and pt_place=?
	order by pt_create_date asc*/
	
	/*select *
	  2  from(select p.pt_title, i.img_temp1, p.pt_like, p.pt_hit
	  3  from post p, image i
	  4  where p.pt_no=i.pt_no
	  5  order by pt_hit desc)
	  6  where rownum<=3;*/
		/*select *
	  from(select p.pt_title, i.img_temp1, p.pt_like, p.pt_hit
	  from post p, image i
	  where p.pt_no=i.pt_no
	  order by pt_hit desc)
	  where rownum<=3;*/
	public ImageDao() {
		conn=OracleXEConnection.getInstance().getConnection();
	}
	
	public ArrayList<ImageVo> getImgTitle(String pt_place) {
		ArrayList<ImageVo> list=new ArrayList<>();
		sb.setLength(0);
		sb.append("select p.pt_title, i.img_temp1, p.pt_like, p.pt_hit ");
		sb.append("from post p, image i ");
		sb.append("where p.pt_no=i.pt_no and pt_place=? ");
		sb.append("order by pt_create_date asc ");
		
		ImageVo vo=null;
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, pt_place);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			
			int pt_hit=rs.getInt("pt_hit");
			int pt_like=rs.getInt("pt_like");
			String img_temp1=rs.getString("img_temp1");
			String pt_title=rs.getString("pt_title");
			
			vo=new ImageVo(pt_place, img_temp1, pt_title, pt_like, pt_hit);
			list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
			//조회순정렬
	public ArrayList<ImageVo> getHits(String pt_place) {
		ArrayList<ImageVo> list=new ArrayList<>();
		sb.setLength(0);
		sb.append("select p.pt_title, i.img_temp1, p.pt_like, p.pt_hit ");
		sb.append("from post p, image i ");
		sb.append("where p.pt_no=i.pt_no and pt_place=? ");
		sb.append("order by pt_hit desc ");
		
		ImageVo vo=null;
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, pt_place);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			
			int pt_hit=rs.getInt("pt_hit");
			int pt_like=rs.getInt("pt_like");
			String img_temp1=rs.getString("img_temp1");
			String pt_title=rs.getString("pt_title");
			
			vo=new ImageVo(pt_place, img_temp1, pt_title, pt_like, pt_hit);
			list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
		//좋아요 정렬
	public ArrayList<ImageVo> getLike(String pt_place) {
		ArrayList<ImageVo> list=new ArrayList<>();
		sb.setLength(0);
		sb.append("select p.pt_title, i.img_temp1, p.pt_like, p.pt_hit ");
		sb.append("from post p, image i ");
		sb.append("where p.pt_no=i.pt_no and pt_place=? ");
		sb.append("order by pt_like desc ");
		
		ImageVo vo=null;
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, pt_place);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			
			int pt_hit=rs.getInt("pt_hit");
			int pt_like=rs.getInt("pt_like");
			String img_temp1=rs.getString("img_temp1");
			String pt_title=rs.getString("pt_title");
			
			vo=new ImageVo(pt_place, img_temp1, pt_title, pt_like, pt_hit);
			list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
			//좋아요 상위 3 조회
	public ArrayList<ImageVo> getLikeThree() {
		ArrayList<ImageVo> list=new ArrayList<>();
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from(select p.pt_place, p.pt_title, i.img_temp1, p.pt_like, p.pt_hit ");
		sb.append("from post p, image i ");
		sb.append("where p.pt_no=i.pt_no ");
		sb.append("order by pt_like desc) ");
		sb.append("where rownum<=3 ");
		
		ImageVo vo=null;
		try {
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
			
			String pt_place=rs.getString("pt_place");
			int pt_hit=rs.getInt("pt_hit");
			int pt_like=rs.getInt("pt_like");
			String img_temp1=rs.getString("img_temp1");
			String pt_title=rs.getString("pt_title");
			
			vo=new ImageVo(pt_place, img_temp1, pt_title, pt_like, pt_hit);
			list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
			//조회순 상위 3 조회
	public ArrayList<ImageVo> getHitThree() {
		ArrayList<ImageVo> list=new ArrayList<>();
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from(select p.pt_place, p.pt_title, i.img_temp1, p.pt_like, p.pt_hit ");
		sb.append("from post p, image i ");
		sb.append("where p.pt_no=i.pt_no ");
		sb.append("order by pt_hit desc) ");
		sb.append("where rownum<=3 ");
		
		ImageVo vo=null;
		try {
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
			
			String pt_place=rs.getString("pt_place");
			int pt_hit=rs.getInt("pt_hit");
			int pt_like=rs.getInt("pt_like");
			String img_temp1=rs.getString("img_temp1");
			String pt_title=rs.getString("pt_title");
			
			vo=new ImageVo(pt_place, img_temp1, pt_title, pt_like, pt_hit);
			list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}//class end
