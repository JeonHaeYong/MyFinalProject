package kh.spring.daoImpl;

import org.springframework.stereotype.Repository;

import kh.spring.dao.ChartDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

@Repository
public class ChartDAOImpl implements ChartDAO
{
//	@Autowired
//	private SqlSessionTemplate sst;
	
	@Override
	public int getTodayVisitCount() throws Exception
	{
		return 1;
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
	public int visitCountPlus() throws Exception
	{
//		return sst.update("ChartDAO.visit");
		String sql = "update chart set visit_count = (visit_count + 1) where (to_char(time, 'yy/mm/dd') = to_char( sysdate, 'yy/mm/dd'))";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			int result = pstat.executeUpdate();
//			con.commit();
			
			return result;
		}
		
		
	}
	
}
