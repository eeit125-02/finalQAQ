package com.web.book.controller;

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

import com.web.book.model.BookStoreBean;
import com.web.book.model.MemberBean;
import com.web.book.model.ShoppingCartBean;
import com.web.book.service.BookStoreService;
import com.web.book.service.ShoppingCartService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Controller
@SessionAttributes(value = { "loginUser", "listCart" })
public class ShoppingCartController {

	@Autowired
	ShoppingCartService scService;

	@Autowired
	BookStoreService bsService;

	MemberBean loginUser;
	public static AllInOne all;

	@ModelAttribute
	public void setLoginUser(Model model, SessionStatus status) {
		loginUser = (MemberBean) model.getAttribute("loginUser");

	}

	private static void initial() {
		all = new AllInOne("");
	}

	@GetMapping("/shopping")
	public String cartMain(Model model) {
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
		Boolean qaq = true;
		List<ShoppingCartBean> list = scService.searchCart(loginUser.getMb_ID());
		for (ShoppingCartBean shoppingCartBean : list) {
			if (bk_ID == shoppingCartBean.getBook().getBk_ID() && bs_Price == shoppingCartBean.getCart_Price()) {
				qaq = false;
				scService.updateCartAll(cart_Num + shoppingCartBean.getCart_Num(), bk_ID);
				bsService.updateBookStore(bks_ID, (bs_Num - cart_Num), bs_Price);
				list = scService.searchCart(loginUser.getMb_ID());
				model.addAttribute("listCart", list);
			}
		}
		if (qaq) {
			scService.addToCart(cart_Num, bs_Price, bk_ID, loginUser.getMb_ID(), bs_ID, bks_ID);
			bsService.updateBookStore(bks_ID, (bs_Num - cart_Num), bs_Price);
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
				scService.updateBookStore(bks, amount);
				qaq = false;
				break;
			}
			continue;
		}
//		 如果購物車沒有這筆資料則新增
		if (qaq) {
			scService.addToCart(qty, bp, bk, loginUser.getMb_ID(),
					bsService.getOneBookStore(bks).getMember().getMb_ID(), bks);
			scService.updateBookStore(bks, amount);
		}
		return map;
	}

	// 直接購買
	@PostMapping("/dctyBuy")
	public String cartDetail(Model model, @RequestParam(value = "bks_ID", required = false) Integer bks_ID,
			@RequestParam(value = "cart_Num", required = false) Integer cart_Num) {
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
				scService.updateBookStore(bks_ID, bookStoreBean.getBs_Num() - cart_Num);
				qaqCart = false;
				break;
			}
			continue;
		}
		if (qaqCart) {
			scService.addToCart(cart_Num, bookStoreBean.getBs_Price(), bookStoreBean.getBook().getBk_ID(),
					loginUser.getMb_ID(), bsService.getOneBookStore(bks_ID).getMember().getMb_ID(), bks_ID);
			scService.updateBookStore(bookStoreBean.getBks_ID(), bookStoreBean.getBs_Num() - 1);
		}
		list = scService.searchCart(loginUser.getMb_ID());
//		for (ShoppingCartBean shoppingCartBean : list) {
//			System.out.println("-------------------------------------------------");
//			System.out.println(shoppingCartBean.getCart_Num());			
//			System.out.println(shoppingCartBean.getCart_Price());			
//			total += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
//		}
//		model.addAttribute("total", total);
		model.addAttribute("listCart", list);
		return "Transation/shoppingCart";
	}

	@PostMapping("deleteCart")
	public String deleteCart(Model model, @RequestParam(value = "cart_ID", required = false) Integer cart_ID) {
		scService.deleteCart(cart_ID);
		model.addAttribute("listCart", scService.searchCart(loginUser.getMb_ID()));
		return "redirect:/shopping";
	}

	@PostMapping("updateCart")
	@ResponseBody
	public Map<String, String> updateCart(
			@RequestParam(value = "cartNum") int cartNum,
			@RequestParam(value = "bksID") int bksID,
			@RequestParam(value = "cartID") int cartID
			) {
		System.out.println("++++++++++++++++++++++++++++++++++++++++");
		System.out.println(cartNum);
		System.out.println(bksID);
		System.out.println(cartID);
		System.out.println("----------------------------------------");
		Map<String, String> map = new HashMap<>();
		map.put("work", "大成功");
		return map;
	}

	// 套用綠界
	@PostMapping("checkout")
	@ResponseBody
	public String checkoutTest(Model model, @RequestParam String bko_Name, @RequestParam String bko_Add,
			@RequestParam String bko_Cel) {
		System.out.println(bko_Name);
		System.out.println(bko_Add);
		System.out.println(bko_Cel);
		initial();
		int qaqQty = (int) (Math.random() * (4000)) + 1000;
		Date date = new Date();

		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo("book" + qaqQty);
		obj.setMerchantTradeDate(date.toString());
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://localhost:8080/BookWeb/bkCheckout");
		obj.setClientBackURL(null);
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	@PostMapping("bkCheckout")
	public String bkCheckout() {
		return "/Transation/bkCheckout";
	}

//	@PostMapping("shopping")
//	public String addCart(Model model,
//			@RequestParam(value = "bk_ID", defaultValue = "0", required = false) Integer bk_ID,
//			@RequestParam(value = "bk_ID1", defaultValue = "0", required = false) Integer bk_ID2,
//			@RequestParam(value = "bk_Price", required = false) Integer bk_Price) {
//
//		Integer tatolMoney = 0;
//		System.out.println("-------------------------------------");
//		System.out.println("bk_ID=" + bk_ID);
//		System.out.println("bk_ID1=" + bk_ID2);
//		System.out.println("bk_Price=" + bk_Price);
//		System.out.println("-------------------------------------");
//// 先搜尋購物車內容
//		List<ShoppingCartBean> listCart = scService.searchCart(loginUser.getMb_ID());
//// 判斷按哪種按鈕 bk_ID:直接購買
//		if (bk_ID != 0 && bk_ID2 == 0) {
//// 如果listCart沒內容新增		
//			if (listCart.size() == 0) {
//				scService.addToCart(1, bk_Price, bk_ID, loginUser.getMb_ID());
//				listCart = scService.searchCart(loginUser.getMb_ID());
//				model.addAttribute("list", listCart);
//				for (ShoppingCartBean shoppingCartBean : listCart) {
//					tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
//				}
//				model.addAttribute("totalCart", tatolMoney);
//				return "Transation/shoppingCart";
//// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面 -> 改成跳到購物車
//			} else {
//				for (ShoppingCartBean shoppingCartBean : listCart) {
//					if (bk_ID == shoppingCartBean.getBook().getBk_ID()) {
////						List<BookBean> list = bsService.searchBookStore(1);
////						model.addAttribute("store", list);
//						listCart = scService.searchCart(loginUser.getMb_ID());
//						model.addAttribute("list", listCart);
//						return "Transation/shoppingCart";
//					}
//				}
//// 沒有內容新增
//				scService.addToCart(1, bk_Price, bk_ID, loginUser.getMb_ID());
//				listCart = scService.searchCart(loginUser.getMb_ID());
//				model.addAttribute("list", listCart);
//				for (ShoppingCartBean shoppingCartBean : listCart) {
//					tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
//				}
//				model.addAttribute("totalCart", tatolMoney);
//				return "Transation/shoppingCart";
//			}
//// 判斷按哪種按鈕 bk_ID2:放入購物車
//		} else if (bk_ID == 0 && bk_ID2 != 0) {
//// 如果listCart沒內容新增	
//			if (listCart.size() == 0) {
//				scService.addToCart(1, bk_Price, bk_ID2, loginUser.getMb_ID());
//				listCart = scService.searchCart(loginUser.getMb_ID());
//				model.addAttribute("list", listCart);
//				for (ShoppingCartBean shoppingCartBean : listCart) {
//					tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
//				}
//				model.addAttribute("totalCart", tatolMoney);
//				return "Transation/shoppingCart";
//			}
//// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面
//			for (ShoppingCartBean shoppingCartBean : listCart) {
//				if (bk_ID2 == shoppingCartBean.getBook().getBk_ID()) {
//					model.addAttribute("same", "已經加入購物車");
//					List<BookStoreBean> list = bsService.searchBookStore(1);
//					model.addAttribute("bookstore", list);
//					return "Transation/qaqMain";
//				}
//			}
//// 沒有內容新增
//			scService.addToCart(1, bk_Price, bk_ID2, loginUser.getMb_ID());
//			listCart = scService.searchCart(loginUser.getMb_ID());
//			model.addAttribute("list", listCart);
//			for (ShoppingCartBean shoppingCartBean : listCart) {
//				tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
//			}
//			model.addAttribute("totalCart", tatolMoney);
//			return "Transation/shoppingCart";
//		} else {
//			model.addAttribute("list", listCart);
//			for (ShoppingCartBean shoppingCartBean : listCart) {
//				tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
//			}
//			model.addAttribute("totalCart", tatolMoney);
//			return "Transation/shoppingCart";
//		}
//	}

//	@PostMapping("updateCart.do")
//	public String updateOrDelete(@RequestParam String cmd,
//			@RequestParam(value = "cart_ID", required = false) Integer cart_ID,
//			@RequestParam(value = "cart_Num", required = false) Integer cart_Num, Model model) {
//		List<ShoppingCartBean> listCart = scService.searchCart(loginUser.getMb_ID());
//		if (cmd.equalsIgnoreCase("DEL")) {
//			scService.deleteCart(cart_ID); // 刪除購物車內的某項商品
//			listCart = scService.searchCart(loginUser.getMb_ID());
//			model.addAttribute("list", listCart);
//			return "Transation/shoppingCart";
//		} else if (cmd.equalsIgnoreCase("MOD")) {
//			scService.updateCart(cart_ID, cart_Num); // 修改某項商品的數項
//			listCart = scService.searchCart(loginUser.getMb_ID());
//			model.addAttribute("list", listCart);
//			return "Transation/shoppingCart";
//		} else {
//			listCart = scService.searchCart(loginUser.getMb_ID());
//			model.addAttribute("list", listCart);
//			return "Transation/shoppingCart";
//		}
//	}

	// 測試用
//	@PostMapping("checkout")
//	public String checkoutTest(Model model, @RequestParam String bko_Name, @RequestParam String bko_Add,
//			@RequestParam String bko_Cel) {
//		return "/Transation/bkCheckout";
//	}

}
