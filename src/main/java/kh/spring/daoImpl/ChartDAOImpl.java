package kh.spring.daoImpl;

import kh.spring.dao.ChartDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAOImpl implements ChartDAO
{
	private DataSource ds;
	public ChartDAOImpl() throws Exception
	{
		Context ctx = new InitialContext();//전체 설정 정보?
		Context compenv = (Context)ctx.lookup("java:/comp/env");//특정 설정 정보
		this.ds = (DataSource)compenv.lookup("jdbc");
	}
	public Connection getConnection() throws Exception
	{
		return ds.getConnection();
	}
	@Override
	public int selectCountTodayRecord() throws Exception
	{
		String sql = "select count(*) from chart where to_char(time, 'yy/mm/dd' ) = to_char( sysdate, 'yy/mm/dd')";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery();
		)
		{
			int count = 0;
			
			if(rs.next())
			{
				count = rs.getInt("count(*)");
			}
			
			return count;
		}
	}
	@Override
	public int insertTodayRecord() throws Exception
	{
		String sql = "insert into chart values(default, default)";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			int result = pstat.executeUpdate();
			return result;
		}
	}
	@Override
	public int visitCountPlus() throws Exception
	{
		String sql = "update chart set visit_count = (visit_count + 1) where (to_char(time, 'yy/mm/dd') = to_char( sysdate, 'yy/mm/dd'))";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			int result = pstat.executeUpdate();
			
			return result;
		}
	}
	
//	이 위로는 Listener Method 들
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int getTodayVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getTodayVisitCount");
	}

	@Override
	public int getWeekVisitCount() throws Exception
	{
		return 1;
	}

	@Override
	public int getMonthVisitCount() throws Exception
	{
		return 1;
	}

	@Override
	public int getTotalVisitCount() throws Exception
	{
		return 0;
	}

	
	
	
	
}
