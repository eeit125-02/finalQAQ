package com.web.book.dao.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.SearchBookDAO;
import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;
import com.web.book.model.MemberBean;
import com.web.book.model.SearchTypeBean;


@Repository
public class SearchBookDaoImpl implements SearchBookDAO {

	private int maxpage = 0;

	@Autowired
	SessionFactory factory;

	// 查詢書籍關鍵字
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchBook(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Name like :searchkw";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍作者
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchBookAuthor(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Author like :searchkw";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍出版社
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchBookPublish(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Publish like :searchkw";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍類型
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<BookBean> searchBookType(List<Integer> reslist, Integer page) {
		Session session = factory.getCurrentSession();
		List<BookBean> res1 = new ArrayList<BookBean>();

		String sql = null;
		System.out.println("uuuuuuuuuuuuuuuuuuuuuuu"+reslist);
		int count = reslist.size();
		int qaq = 1;
		for (Integer typeid : reslist) {
			if (qaq == 1) {
				sql = "sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			} else if (qaq <= count) {
				sql += " or sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			}
		}

		String hql = "SELECT bt.book FROM BookTypeBean as bt WHERE " + sql;
		Query<BookBean> query = session.createQuery(hql);
maxpage=query.getResultList().size();
//		for(Integer typeid :reslist) {
//			System.out.println(typeid);
//			String hql = "SELECT book FROM BookTypeBean WHERE sty_ID= :styid";
//			BookBean bt=session.load(BookBean.class, typeid);
//			Query<BookBean> query = session.createQuery(hql);
//			query.setParameter("styid", session.load(BookBean.class, typeid));
//			
//			maxpage=query.setParameter("styid", session.load(BookBean.class, typeid)).getResultList().size();
			query.setFirstResult((page - 1) * 10);
			query.setMaxResults(10);
			res1=query.getResultList();
//			res1 = query.setParameter("styid", bt).getResultList();
//			System.out.println(res1);
//			res.addAll(res1);
//		}	
		return res1;
	}

	// 取得總頁數
	@Override
	public int getResultPage() {
		int totalpage = 0;
		if (maxpage % 10 == 0) {
			totalpage += maxpage / 10;
		} else {
			totalpage += maxpage / 10 + 1;
		}

		return totalpage;
	}
	
	//取得總筆數
	@Override
	public int getResultNumber() {
		return maxpage;
	}
	// 取得單一本書的詳細資訊
	@Override
	@SuppressWarnings("unchecked")
	public BookBean getBook(int id) {
		BookBean result = new BookBean();
		String hql = "FROM BookBean b WHERE b.bk_ID = :bkid";
		Session session = factory.getCurrentSession();
		Query<BookBean> query = session.createQuery(hql);
		result = query.setParameter("bkid", id).getSingleResult();
		return result;
	}
	
	// 取得全部類型
	@Override
	@SuppressWarnings("unchecked")
	public List<SearchTypeBean> getAllBookType() {
		String hql = "FROM SearchTypeBean";
		Session session = factory.getCurrentSession();
		Query<SearchTypeBean> query = session.createQuery(hql);
		return query.getResultList();
	}

	// 取得單一本書的類型
	@Override
	@SuppressWarnings("unchecked")
	public List<BookTypeBean> getBookType(int id) {
		String hql = "FROM BookTypeBean b WHERE b.book = :bkid";
		Session session = factory.getCurrentSession();
		BookTypeBean bt = session.load(BookTypeBean.class, id);
		Query<BookTypeBean> query = session.createQuery(hql);
		return query.setParameter("bkid", bt).getResultList();
	}

	// 確認收藏與否
	@SuppressWarnings("unchecked")
	@Override
	public boolean checkbc(int bk_id, int mb_id) {
		Session session = factory.getCurrentSession();
		MemberBean member = session.get(MemberBean.class, mb_id);
		BookBean book = session.get(BookBean.class, bk_id);
		boolean result = true;

		String hql = "From BookCollectBean bc Where bc.member = :mbid AND bc.book = :bkid";
		Query<BookCollectBean> query = session.createQuery(hql);
		List<BookCollectBean> list = query.setParameter("mbid", member).setParameter("bkid", book).getResultList();
		if (list.size() == 0) {
			result = false;
		}
		return result;

	}

	// 會員收藏清單
	@Override
	@SuppressWarnings("unchecked")
	public List<BookCollectBean> getCollect(int MB_ID) {
		List<BookCollectBean> list = new ArrayList<>();
		String hql = "From BookCollectBean bc Where bc.member = :mbid";
		Session session = factory.getCurrentSession();
		BookCollectBean bc = session.load(BookCollectBean.class, MB_ID);
		Query<BookCollectBean> query = session.createQuery(hql);
		list = query.setParameter("mbid", bc).getResultList();
		return list;
	}
	// 搜尋收藏清單關鍵字
	@Override
	@SuppressWarnings("unchecked")
	public List<BookCollectBean> getKeyCollect(int MB_ID,String key) {
		List<BookCollectBean> list = new ArrayList<>();
		String hql = "From BookCollectBean bc Where "
				+ "bc.member = :mbid"
//				+ " AND bc.bc_Tag_one like :searchString"
//				+ " or bc.bc_Tag_two like :searchString"
//				+ " or bc.bc_Tag_three like :searchString";
				+ " AND (bc.bc_Tag_one like :searchString or bc.bc_Tag_two like :searchString or bc.bc_Tag_three like :searchString)";
		Session session = factory.getCurrentSession();
		BookCollectBean bc = session.load(BookCollectBean.class, MB_ID);
		Query<BookCollectBean> query = session.createQuery(hql);
		list = query.setParameter("mbid", bc).setParameter("searchString", "%"+key+"%").getResultList();
		return list;
	}

	// 刪除收藏項目(單筆)
	@Override
	public boolean deletebc(int bcid) {
		int count = 0;
		boolean result2 = false;
		Session session = factory.getCurrentSession();
		BookCollectBean result = session.load(BookCollectBean.class, bcid);
		session.delete(result);
		count++;
		if (count > 0) {
			result2 = true;
		}
		return result2;
	}
	
	//刪除收藏項目(多筆)
	@SuppressWarnings("unchecked")
	@Override
	public boolean deletebkbc(int bk_id) {
		Session session = factory.getCurrentSession();
		BookBean book = session.get(BookBean.class, bk_id);
		String hql = "DELETE From BookCollectBean bc Where bc.book = :bkid";
		Query<BookCollectBean> query = session.createQuery(hql);
		int list=query.setParameter("bkid", book).executeUpdate();
		if(list>0) {
			return true;
		}
		return false;
	}	

	// 新增or刪除收藏項目
	@SuppressWarnings("unchecked")
	@Override
	public boolean savebc(int bk_id, int mb_id) {
		boolean result = false;
		Session session = factory.getCurrentSession();
		LocalDate d = LocalDate.now();
		java.sql.Date sqlDate = java.sql.Date.valueOf(d);
		MemberBean member = session.get(MemberBean.class, mb_id);
		BookBean book = session.get(BookBean.class, bk_id);

		String hql = "From BookCollectBean bc Where bc.member = :mbid AND bc.book = :bkid";
		Query<BookCollectBean> query = session.createQuery(hql);
		BookCollectBean list;
		try {
			list = query.setParameter("mbid", member).setParameter("bkid", book).getSingleResult();
			session.delete(list);
		} catch (Exception e) {
			e.printStackTrace();
			result = true;
			list = new BookCollectBean(1, sqlDate, null, null, null, book, member);
			session.save(list);
		}
		return result;
	}
	
	//取得收藏tag
	@Override
	public BookCollectBean getbctag(int bc_ID) {
		Session session = factory.getCurrentSession();
		BookCollectBean bc=session.get(BookCollectBean.class, bc_ID);
		return bc;
	}
	
	//新增收藏tag
	@Override
	public BookCollectBean setbctag(int bc_ID, String tag1, String tag2, String tag3) {
		Session session = factory.getCurrentSession();
		BookCollectBean bc=session.get(BookCollectBean.class, bc_ID);
		if(tag1!=null && ""!=tag1) {
			bc.setBc_Tag_one(tag1);
		}
		if(tag2!=null && ""!=tag2) {
			bc.setBc_Tag_two(tag2);
		}
		if(tag3!=null && ""!=tag3) {
			bc.setBc_Tag_three(tag3);
		}
		return bc;
	}
	
	
	//刪除收藏tag
	@Override
	public BookCollectBean deletebctag(int bc_ID, String tag1, String tag2, String tag3) {
		Session session = factory.getCurrentSession();
		BookCollectBean bc=session.get(BookCollectBean.class, bc_ID);
		if(tag1!=null && ""!=tag1) {
			bc.setBc_Tag_one(null);
		}
		if(tag2!=null && ""!=tag2) {
			bc.setBc_Tag_two(null);
		}
		if(tag3!=null && ""!=tag3) {
			bc.setBc_Tag_three(null);
		}
		return bc;
	}
	
	
	
	// 新增書本
	@SuppressWarnings("unused")
	@Override
	public BookBean savebk(BookBean bkc) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.save(bkc);
		count++;
		return bkc;
	}
	
	// 新增書本類型
	@Override
	public int savebkty(List<Integer> tylist, int bk_ID) {
		int count = 0;
		Session session = factory.getCurrentSession();
		BookBean book =session.get(BookBean.class, bk_ID);
		for(int i=0;i<tylist.size();i++) {
			BookTypeBean bkt=new BookTypeBean(null, book, session.get(SearchTypeBean.class, tylist.get(i)));
			session.save(bkt);			
			count++;
		}	
		return count;
	}
	
	
	// 刪除書本類型
	@Override
	@SuppressWarnings("unchecked")
	public boolean deletebkty(int bk_ID) {
		String hql = "Delete FROM BookTypeBean Where book = :bkid";
		Session session = factory.getCurrentSession();
		BookBean bt = session.load(BookBean.class, bk_ID);
		Query<BookTypeBean> query = session.createQuery(hql);
		int list = query.setParameter("bkid", bt).executeUpdate();
		if(list>0) {
			return true;
		}
		return false;
	}

	// 刪除書本
	@Override
	public boolean deletebk(BookBean bkc) {
		int count = 0;
		boolean a = false;
		Session session = factory.getCurrentSession();
		session.delete(bkc);
		count++;
		if (count > 0) {
			a = true;
		}
		return a;
	}

	// 修改書本
	@Override
	public int updatebk(BookBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(mb);
		count++;
		return count;
	}

	//點擊+1
	@Override
	public void addBookClick(Integer bk_ID) {
		Session session = factory.getCurrentSession();
		BookBean bk = session.get(BookBean.class, bk_ID);
		bk.setBk_Click(bk.getBk_Click()+177);	
	}
	
	// 選取全部書籍
	@Override
	@SuppressWarnings("unchecked")
	public List<BookBean> searchAllBook() {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean";
		Query<BookBean> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(50);
		List<BookBean> list=query.getResultList();
		return list;
	}
	
}
