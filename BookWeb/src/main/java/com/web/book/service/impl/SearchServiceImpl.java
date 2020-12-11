package com.web.book.service.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.SearchBookDAO;
import com.web.book.dao.impl.SearchBookDaoImpl;
import com.web.book.model.BookBean;
import com.web.book.model.Book_COLLECTBean;
import com.web.book.service.SearchService;


@Transactional
@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchBookDAO searchBookDAO;
	
	
	//查詢書籍關鍵字
	@Override
	public List<BookBean> searchBook(String name){
		return searchBookDAO.searchBook(name);	
	}
	
		
	//取得單一本書的詳細資訊
	@Override
	public BookBean getBook(int id) {
		return searchBookDAO.getBook(id);	
	}
	
	
	// 會員收藏清單
	@Override
	public List<Book_COLLECTBean> gotoCollect(int id) {
		return searchBookDAO.getCollect(id);	
	}
	
		
	// 刪除收藏項目
	@Override
	public int delete(int bcid) {
		return searchBookDAO.deletebc(bcid);
	}
	
	
	// 新增收藏項目
	@Override
	public int savebc(int bk_ID, int mb_ID) {
		int count = 0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		
		
		try {
			tx = session.beginTransaction();
			MemberBean member = session.get(MemberBean.class, mb_ID);
			BookBean book = session.get(BookBean.class, bk_ID);
			Book_COLLECTBean bkc=new Book_COLLECTBean(1, sqlDate, null, book, member);
			dao.savebc(bkc);
			count++;
			tx.commit();
		} catch(Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		return count;
	}
	
	
	
	
	// 新增書本
	@Override
	public int savebk(BookBean bkc) {
		return searchBookDAO.savebk(bkc);
	}

	
	// 修改書本
	@Override
	public int updatebk(BookBean mb) {
		return searchBookDAO.updatebk(mb);
	}
		

}
