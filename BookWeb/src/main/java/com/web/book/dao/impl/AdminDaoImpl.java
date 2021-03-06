package com.web.book.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.AdminDao;
import com.web.book.model.ActBean;
import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.PostBean;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	SessionFactory factory;

	// 獲得半年心得撰寫數量 
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getMonthReportWrite() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(br.br_DateTime), MONTH(br.br_DateTime), count(br) "
				   + "from BookReportBean br "
				   + "group by YEAR(br.br_DateTime), MONTH(br.br_DateTime) "
				   + "ORDER by YEAR(br.br_DateTime) DESC, MONTH (br.br_DateTime) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}

	// 獲得半年心得瀏覽數量
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getMonthReportViews() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(br.br_DateTime), MONTH(br.br_DateTime), sum(br.br_ClickNumber) "
				   + "from BookReportBean br "
				   + "group by YEAR(br.br_DateTime), MONTH(br.br_DateTime) "
				   + "ORDER by YEAR(br.br_DateTime) DESC, MONTH (br.br_DateTime) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}

	// 獲得所有書籍資訊
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> getAllbook() {
		
		Session session = factory.getCurrentSession();
		String hql = "From BookBean";
		
		Query<BookBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 獲得所有活動資料
	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> getAllAct() {
		
		Session session = factory.getCurrentSession();
		String hql = "From ActBean";
		Query<ActBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 獲得所有討論版資料
	@SuppressWarnings("unchecked")
	@Override
	public List<PostBean> getAllPost() {
		
		Session session = factory.getCurrentSession();
		String hql = "From PostBean";
		Query<PostBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 獲得所有購物資料
	@SuppressWarnings("unchecked")
	@Override
	public List<BookStoreBean> getAllStrore() {
		
		Session session = factory.getCurrentSession();
		String hql = "From BookStoreBean where bs_ID != 14 order by bks_ID DESC";
		Query<BookStoreBean> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(1000);
		
		return query.getResultList();
	}

	// 取得讀書資料
	@SuppressWarnings("unchecked")
	@Override
	public BookBean getBook(Integer bkId) {
		Session session = factory.getCurrentSession();
		String hql = "From BookBean bk Where bk.bk_ID =  :bkId";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("bkId", bkId);
		
		return query.getSingleResult();
	}

	//  刪除圖書資料
	@Override
	public Boolean deleteBook(Integer bkId) {
		
		Session session = factory.getCurrentSession();
		
		String hql = "Delete BookStoreBean bs Where bs.book.bk_ID = :bk_ID";
		session.createQuery(hql).setParameter("bk_ID", bkId).executeUpdate();
		hql = "Delete BookReportBean br where br.book.bk_ID = :bk_ID";
		session.createQuery(hql).setParameter("bk_ID", bkId).executeUpdate();
		hql = "Delete BookTypeBean bt where bt.book.bk_ID = :bk_ID";
		session.createQuery(hql).setParameter("bk_ID", bkId).executeUpdate();
		hql = "Delete OrderItemBean bo where bo.book.bk_ID = :bk_ID";
		session.createQuery(hql).setParameter("bk_ID", bkId).executeUpdate();
		hql = "Delete BookBean bk Where bk.bk_ID = :bk_ID";
		session.createQuery(hql).setParameter("bk_ID", bkId).executeUpdate();
		
		
		return true;
	}

	// 刪除指定討論版
	@Override
	public Boolean deletePost(Integer postId) {
		
		Session session = factory.getCurrentSession();
		String hql = "Delete CommandBean command Where command.postBean.post_id = :postId";
		session.createQuery(hql).setParameter("postId", postId).executeUpdate();
		hql = "Delete PostBean ps Where ps.post_id = :postId";
		session.createQuery(hql).setParameter("postId", postId).executeUpdate();
		
		return true;
	}

	// 刪除部分活動
	@Override
	public Boolean deleteAct(Integer actId) {
		
		Session session = factory.getCurrentSession();
		String hql = "Delete ActJoinBean aj Where aj.act.act_ID = :actId";
		session.createQuery(hql).setParameter("actId", actId).executeUpdate();
		hql = "Delete ActBean act Where act.act_ID = :actId";
		session.createQuery(hql).setParameter("actId", actId).executeUpdate();
		
		return true;
	}
	
	// 取得每半年貼文撰寫數量
	@SuppressWarnings("unchecked")
	public List<Object> getMonthPostWrite() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(post.post_time), MONTH(post.post_time), count(post) "
				   + "from PostBean post "
				   + "group by YEAR(post.post_time), MONTH(post.post_time) "
				   + "ORDER by YEAR(post.post_time) DESC, MONTH (post.post_time) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}
	
	// 獲得半年貼文點擊數量
	@SuppressWarnings("unchecked")
	public List<Object> getMonthPostView() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(post.post_time), MONTH(post.post_time), sum(post.click) "
				   + "from PostBean post "
				   + "group by YEAR(post.post_time), MONTH(post.post_time) "
				   + "ORDER by YEAR(post.post_time) DESC, MONTH (post.post_time) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}
	
	// 書籍類型(共九大類)分別有多少藏書的比例圖
	@SuppressWarnings("unchecked")
	public List<Object> getBookTpyeTable() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select bt.searchtype.sty_Name, bt.searchtype.sty_ID ,COUNT(bt)  "
				   + "from BookTypeBean bt "
				   + "where bt.searchtype.sty_ID = 9 or bt.searchtype.sty_ID = 10 or bt.searchtype.sty_ID = 18 or bt.searchtype.sty_ID = 28 "
				   + "or bt.searchtype.sty_ID = 37 or bt.searchtype.sty_ID = 47 or bt.searchtype.sty_ID = 63 or bt.searchtype.sty_ID = 70 "
				   + "group by bt.searchtype.sty_ID , bt.searchtype.sty_Name "
				   + "order by bt.searchtype.sty_ID ASC";
		Query<Object> query = session.createQuery(hql);
		
		return query.getResultList();
	}
	
	// 書籍出版年份統計(未完成)
	@SuppressWarnings("unchecked")
	public List<Object> getBookYearTable() {	
		
		Session session = factory.getCurrentSession();
		String hql = "Select bt.sty_ID ,COUNT(bt)  "
				   + "from BookTypeBean bt "
				   + "where bt.sty_ID = 0 or bt.sty_ID = 9 or bt.sty_ID = 17 or bt.sty_ID = 27 or bt.sty_ID = 36 "
				   + "or bt.sty_ID = 46 or bt.sty_ID = 56 or bt.sty_ID = 62 or bt.sty_ID = 69 "
				   + "group by bt.sty_ID ";
		Query<Object> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 取得每半年註冊會員數量
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getRegistereMonth() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(m.mb_Date), MONTH(m.mb_Date), count(m) "
				   + "from MemberBean m "
				   + "group by YEAR(m.mb_Date), MONTH(m.mb_Date) "
				   + "ORDER by YEAR(m.mb_Date) DESC, MONTH (m.mb_Date) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}
	
	// 取得每半年成交量數量
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getStoreMonthPsc() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR (a.bo_Date), MONTH (a.bo_Date), sum(b.oi_Qty) "
				   + "from BookOrderBean a, OrderItemBean b "
				   + "where a.bo_ID = b.order.bo_ID "
				   + "GROUP by YEAR (a.bo_Date) , MONTH (a.bo_Date) "
				   + "ORDER by YEAR (a.bo_Date) DESC , MONTH (a.bo_Date) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}
	
	// 取得每半年成交價格
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getStoreMonthPrice() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR (a.bo_Date), MONTH (a.bo_Date), sum(a.bo_Total) "
				   + "from BookOrderBean a "
				   + "GROUP by YEAR (a.bo_Date) , MONTH (a.bo_Date) "
				   + "ORDER by YEAR (a.bo_Date) DESC , MONTH (a.bo_Date) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}

	// 取得註冊會員男女比例
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getSexRatio() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select m.mb_Sex, count(m) "
				   + "from MemberBean m "
				   + "group by m.mb_Sex";
		Query<Object> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 取得活動類別比例
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getActCategoryRatio() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select ar.act_Theme, count(ar) "
				   + "from ActBean ar "
				   + "group by  ar.act_Theme";
		Query<Object> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 獲得近半年活動參與人數
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getActMonthNumberOfParticipants() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(ar.act_Date), MONTH(ar.act_Date), count(ar) "
				   + "from ActBean ar "
				   + "group by YEAR(ar.act_Date), MONTH(ar.act_Date), DAY(ar.act_Date)"
				   + "ORDER by YEAR(ar.act_Date) DESC, MONTH (ar.act_Date), DAY(ar.act_Date) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(7);
		
		return query.getResultList();
	}

	
	
	
	
	

}
