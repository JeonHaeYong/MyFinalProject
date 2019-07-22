package kh.spring.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dao.ItemDAO;
import kh.spring.dto.ItemDTO;
import kh.spring.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDAO itemDao;
	
	@Override
	public int uploadItem(ItemDTO dto) {
		System.out.println("Service 실행");
		return itemDao.insertItem(dto);
	}

	@Override
	public List<ItemDTO> selectItemPerPage(int currentPage) {
		Map<String, Integer> navi = itemDao.getNaviforItem(currentPage, itemDao.itemContentsSize());
		return itemDao.selectItemPerPage(navi.get("fromIndex"), navi.get("toIndex"));
	}

	@Override
	public List<ItemDTO> selectItemPerPageByCategory(int currentPage, String category) {
		Map<String, Integer> navi = itemDao.getNaviforItem(currentPage, itemDao.itemContentsSize());
		return itemDao.selectItemPerPageByCategory(category, navi.get("fromIndex"), navi.get("toIndex"));
	}

	@Override
	public ItemDTO readOneItem(int seq) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ItemDTO dto = itemDao.readOneItem(seq);
		dto.setFomredDate(sdf.format(dto.getWrite_date()));
		return dto;
	}

	@Override
	public int deleteItem(ItemDTO dto) {
		return itemDao.deleteItem(dto);
	}

	@Override
	public int itemContentsSize() {
		return itemDao.itemContentsSize();
	}
	
	@Override
	public int itemContentsSizeByCategory(String category) {
		return itemDao.itemContentsSizeByCategory(category);
	}
	
	@Override
	public Map<String, Integer> getNaviforItem(int currentPage, String category) {
		if(category.equals("all")) {
			return itemDao.getNaviforItem(currentPage, itemDao.itemContentsSize());
		}else {
			return itemDao.getNaviforItem(currentPage, itemDao.itemContentsSizeByCategory(category));
		}
	}

	
	
	// 무작위 데이터 삽입
	// Author: SJH
	// return: 이동할 Page
	@Override
	public Object insertDummy() throws Exception
	{
		for(int i = 1 ; i <= 300 ; i++)
		{
			ItemDTO dto = new ItemDTO();
			
			dto.setName("Naaame"+i);
			dto.setContents("Conteeeeeents"+i);
			dto.setPrice((1000+i)+"");
			dto.setSeller("Seeeeeeller"+i);
			
			if((i % 3) == 0)
			{
				dto.setImagePath1("/resources/images/item/item1.jpg");
				dto.setCategory("food");
			}
			else if((i % 3) == 1)
			{
				dto.setImagePath1("/resources/images/item/item2.jpg");
				dto.setCategory("toy");
			}
			else if((i % 3) == 2)
			{
				dto.setImagePath1("/resources/images/item/item3.jpg");
				dto.setCategory("etc");
			}
			else
			{
				dto.setImagePath1("/resources/images/item/item3.jpg");
				dto.setCategory("etc");
			}
			
			itemDao.insertItem(dto);
		}
		
		System.out.println("데이터 삽입 완료");
		
		return "redirect: admin-item";
	}
	// 관리자 페이지 조회용 한번에 10개씩 조회
	// Author: SJH
	// return: ItemDTO -> JSON
	@Override
	public String selectForAdmin(String page) throws Exception
	{
		System.out.println("검색한 페이지 : " + page);
		
		if((page == null) || (page.equals("")))
		{
			page = "1";
		}
		
		int currentPage = Integer.parseInt(page);
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordTotalCount = itemDao.selectCountForAdmin();
		int pageTotalCount;
		boolean needPrev = true;
		boolean needNext = true;
		
		int start = currentPage * recordCountPerPage - recordCountPerPage + 1;
		int end = currentPage * recordCountPerPage;
		
		List<ItemDTO> list = itemDao.selectForAdmin(start, end);
		
		JsonObject outerjo = new JsonObject();
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			
			int seq = list.get(i-1).getSeq();
			String name = list.get(i-1).getName();
			String price = list.get(i-1).getPrice();
			String seller = list.get(i-1).getSeller();
			
			jo.addProperty("seq", seq);
			jo.addProperty("name", name);
			jo.addProperty("price", price);
			jo.addProperty("seller", seller);
			ja.add(jo);
		}
		outerjo.add("array", ja);
		
		if( recordTotalCount % recordCountPerPage == 0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}

		if(currentPage < 1)
		{
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount)
		{
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		if(startNavi == 1)
		{
			needPrev = false;
		}
		if(endNavi == pageTotalCount)
		{
			needNext = false;
		}
		
		outerjo.addProperty("currentPage", currentPage);
		outerjo.addProperty("needPrev", needPrev);
		outerjo.addProperty("needNext", needNext);
		outerjo.addProperty("startNavi", startNavi);
		outerjo.addProperty("endNavi", endNavi);

		
		return new Gson().toJson(outerjo);
	}

	@Override
	public String permissionItems(String items) throws Exception
	{
		String[] seqArr = items.split(" ");
		
		if(seqArr.length >= 2)
		{
			for(int i = 2 ; i <= seqArr.length ; i++)
			{
				itemDao.updatePermissionBySeq(Integer.parseInt(seqArr[i-1]));
			}
			return "Y";
		}
		
		return "N";
		
	}
	
	
}
