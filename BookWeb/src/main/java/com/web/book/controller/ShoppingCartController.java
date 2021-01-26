package com.web.book.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.book.model.BookOrderBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.MemberBean;
import com.web.book.model.OrderItemBean;
import com.web.book.model.ShoppingCartBean;
import com.web.book.service.BookStoreService;
import com.web.book.service.ShoppingCartService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
@SessionAttributes(value = { "loginUser", "item", "total", "tstime"})
public class ShoppingCartController {

	@Autowired
	ShoppingCartService scService;

	@Autowired
	BookStoreService bsService;

	MemberBean loginUser;

	@ModelAttribute
	public void setLoginUser(Model model, SessionStatus status) {
		loginUser = (MemberBean) model.getAttribute("loginUser");

	}
	
	public static String genAioCheckOutOneTime(Integer bo_ID, String date, Integer total,String product, String url){
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo("bookTransation" + bo_ID);
		obj.setMerchantTradeDate(date);
		obj.setTotalAmount(total.toString());
		obj.setTradeDesc("書適圈");
		obj.setItemName(product);
		obj.setReturnURL(url);
		obj.setClientBackURL(url);
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	
	// 套用綠界 List<String>
	@PostMapping("/checkout")
	public String checkoutTest(Model model, 
			@RequestParam String bo_Name, 
			@RequestParam String bo_Add,
			@RequestParam Integer bo_Cel
			) {
//		List<String> relist = new ArrayList<String>();
//		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++");
//		System.out.println("bo_Name= " + bo_Name);
//		System.out.println("bo_Cel= " + bo_Cel);
//		System.out.println("bo_Add= " + bo_Add);
//		System.out.println("---------------------------------------------------");
//			relist.add("/Member/login");
//			return relist;
		if (loginUser == null) {
			return "redirect:/toLogin";
		}
		int total = 0;
		int count = 0;
//		int mb_Delete = 0;
		String success = "已結帳";
//		String fail = "未結帳";
		Date date = new Date();
		String url = "http://localhost:8080/BookWeb/transation";
		StringBuilder product = new StringBuilder();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
// 總價錢計算
		List<ShoppingCartBean> list = scService.searchCart(loginUser.getMb_ID());
		for (ShoppingCartBean cart : list) {
			total += cart.getCart_Num()*cart.getCart_Price();
// 庫存扣掉購買
			BookStoreBean oneMbStore = bsService.getOneBookStore(cart.getBks_ID());
			bsService.updateBookStore(cart.getBks_ID(), oneMbStore.getBs_Num()-cart.getCart_Num(), oneMbStore.getBs_Price());
//			cart.getMemberSel().getMb_ID();
		}
// 建立訂單
		scService.insertOrder(date, total, bo_Name, bo_Add, bo_Cel, loginUser.getMb_ID(), success);
// 建立訂單明細
		BookOrderBean oreder = scService.searchOrder(date, loginUser.getMb_ID());
		for (ShoppingCartBean cart : list) {
			scService.insertItem(oreder.getBo_ID(), cart.getMemberSel().getMb_ID(), cart.getBook().getBk_ID(), cart.getCart_Num(), cart.getCart_Price());
			if (count == 0) {
				product.append(cart.getBook().getBk_Name());
				product.append("   單價: " + cart.getCart_Price()+"      數量: " + cart.getCart_Num() + "      賣家: " + cart.getMemberSel().getMb_Name());
				count++;
			} else {
				product.append("#" + cart.getBook().getBk_Name());			
				product.append("   單價: " + cart.getCart_Price()+"      數量: " + cart.getCart_Num() + "      賣家: " + cart.getMemberSel().getMb_Name());
			}
		}		
// 把購物車資料清掉
		scService.deleteAllCart(loginUser.getMb_ID());
		String form = genAioCheckOutOneTime(oreder.getBo_ID(), sdf.format(date), total, product.toString(), url);
		List<OrderItemBean> item = scService.orderDetail(oreder.getBo_ID());
		model.addAttribute("obj", form);
		model.addAttribute("item", item);
		model.addAttribute("total", oreder.getBo_Total());
		model.addAttribute("tstime", date);
//		return relist;
//實際跑
		return "/Transation/bkCheckout";
//測試
//		return "/Transation/transationDetail";
	}
	
	// 導入交易明細
	@GetMapping(value = "/transation")
	public String tsDetail(Model model) {
		return "/Transation/transationDetail";
	}

	// 點擊購物車
	@GetMapping("/shopping")
	public String cartMain(Model model) {
		if (loginUser == null) {
			return "redirect:/toLogin";
		}
		List<ShoppingCartBean> list = scService.searchCart(loginUser.getMb_ID());
		model.addAttribute("listCart", list);
		return "Transation/shoppingCart";
	}

	// 價錢區間直接購買
	@PostMapping("/directBuy")
	public String directBuy(Model model, @RequestParam(value = "bs_Num", required = false) int bs_Num,
			@RequestParam(value = "bs_Price", required = false) int bs_Price,
			@RequestParam(value = "bk_ID", required = false) int bk_ID,
			@RequestParam(value = "bs_ID", required = false) int bs_ID,
			@RequestParam(value = "cart_Num", required = false) int cart_Num,
			@RequestParam(value = "bks_ID", required = false) int bks_ID) {
//		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
//		System.out.println("------------------------------------------");
		if (loginUser == null) {
			return "redirect:/toLogin";
		}
		Boolean onOff = true;
		List<ShoppingCartBean> list = scService.searchCart(loginUser.getMb_ID());
		for (ShoppingCartBean shoppingCartBean : list) {
			if (bk_ID == shoppingCartBean.getBook().getBk_ID() && bs_Price == shoppingCartBean.getCart_Price()) {
				onOff = false;
				scService.updateCartAll(cart_Num + shoppingCartBean.getCart_Num(), bk_ID);
//				bsService.updateBookStore(bks_ID, (bs_Num - cart_Num), bs_Price);
				list = scService.searchCart(loginUser.getMb_ID());
				model.addAttribute("listCart", list);
			}
		}
		if (onOff) {
			scService.addToCart(cart_Num, bs_Price, bk_ID, loginUser.getMb_ID(), bs_ID, bks_ID);
//			bsService.updateBookStore(bks_ID, (bs_Num - cart_Num), bs_Price);
			list = scService.searchCart(loginUser.getMb_ID());
			model.addAttribute("listCart", list);
		}
		return "redirect:/shopping";
	}

	// 放入購物車
	@GetMapping("/addCart")
	@ResponseBody
	public Map<String, Object> inCar(@RequestParam(value = "bk", required = false) Integer bk,
			@RequestParam(value = "bp", required = false) Integer bp,
			@RequestParam(value = "bs", required = false) Integer bs,
			@RequestParam(value = "bks", required = false) Integer bks,
			@RequestParam(value = "qty", required = false) Integer qty) {
//		{ bk : bk_ID1, bp : bs_Price, bn : bs_Num, bks : $('bks_ID').val() }
		Integer amount = (bs - qty);
		Boolean qaq = true;
		bsService.getOneBookStore(bks);
		Map<String, Object> map = new HashMap<>();
		map.put("qty", amount);
		List<ShoppingCartBean> list = scService.searchCart(loginUser.getMb_ID());
		for (ShoppingCartBean shoppingCartBean : list) {
//			 如果購物車已經有這筆資料更新
			if (bk.equals(shoppingCartBean.getBook().getBk_ID())) {
				scService.updateCartAll(shoppingCartBean.getCart_Num() + qty, bk);
//				scService.updateBookStore(bks, amount);
				qaq = false;
				break;
			}
			continue;
		}
//		 如果購物車沒有這筆資料則新增
		if (qaq) {
			scService.addToCart(qty, bp, bk, loginUser.getMb_ID(),
					bsService.getOneBookStore(bks).getMember().getMb_ID(), bks);
//			scService.updateBookStore(bks, amount);
		}
		return map;
	}

	// 直接購買
	@PostMapping("/dctyBuy")
	public String cartDetail(Model model, @RequestParam(value = "bks_ID", required = false) Integer bks_ID,
			@RequestParam(value = "cart_Num", required = false) Integer cart_Num) {
		if (loginUser == null) {
			return "redirect:/toLogin";
		}
//		System.out.println("----------------------------------------------");
//		System.out.println(cart_Num);
		// 先搜尋購物車裡的內容
		Boolean qaqCart = true;
//		int total = 0;
		BookStoreBean bookStoreBean = bsService.getOneBookStore(bks_ID);
		List<ShoppingCartBean> list = scService.searchCart(loginUser.getMb_ID());
		for (ShoppingCartBean shoppingCartBean : list) {
			if (bookStoreBean.getBook().getBk_ID() == shoppingCartBean.getBook().getBk_ID()) {
				scService.updateCartAll(shoppingCartBean.getCart_Num() + cart_Num, bookStoreBean.getBook().getBk_ID());
//				scService.updateBookStore(bks_ID, bookStoreBean.getBs_Num() - cart_Num);
				qaqCart = false;
				break;
			}
			continue;
		}
		if (qaqCart) {
			scService.addToCart(cart_Num, bookStoreBean.getBs_Price(), bookStoreBean.getBook().getBk_ID(),
					loginUser.getMb_ID(), bsService.getOneBookStore(bks_ID).getMember().getMb_ID(), bks_ID);
//			scService.updateBookStore(bookStoreBean.getBks_ID(), bookStoreBean.getBs_Num() - 1);
		}
		list = scService.searchCart(loginUser.getMb_ID());
		model.addAttribute("listCart", list);
		return "Transation/shoppingCart";
	}

//  刪除購物車資料
	@PostMapping("/deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(@RequestParam(value = "cartID", required = false) Integer cart_ID) {
		scService.deleteCart(cart_ID);
		Map<String, Object> map = new HashMap<>();
		map.put("work", "刪除成功");
		return map;
	}

//	ajax 更新數量
	@PostMapping("updateCart")
	@ResponseBody
	public Map<String, Object> updateCart(
			@RequestParam(value = "cartNum") Integer cartNum,
			@RequestParam(value = "bksID") Integer bksID,
			@RequestParam(value = "cartID") Integer cartID
			) {
		Map<String, Object> map = new HashMap<>();
// 違法的購買數量或者買一個
		if (cartNum <= 1) {
			scService.updateCart(cartID, 1);
			map.put("minnum", 1);
		} else {
			BookStoreBean store = bsService.getOneBookStore(bksID);
			map.put("maxnum", store.getBs_Num());
// 超過庫存
			if (cartNum > store.getBs_Num()) {
				scService.updateCart(cartID, store.getBs_Num());
				map.put("buynum", store.getBs_Num());
			} else {
				scService.updateCart(cartID, cartNum);
				map.put("buynum", cartNum);
			}
		}
//		System.out.println("++++++++++++++++++++++++++++++++++++++++");
//		System.out.println(cartNum);
//		System.out.println(bksID);
//		System.out.println(cartID);
//		System.out.println("----------------------------------------");
		return map;
	}



}
