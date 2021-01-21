package com.web.book.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import ecpay.payment.integration.domain.AioCheckOutCVS;
import ecpay.payment.integration.domain.InvoiceObj;

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
	
	public static String genAioCheckOutCVS(){
		AioCheckOutCVS obj = new AioCheckOutCVS();
		InvoiceObj invoice = new InvoiceObj();
		UUID uid = UUID.randomUUID();
		obj.setMerchantTradeNo(uid.toString().replaceAll("-", "").substring(0, 20));
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setStoreExpireDate("3");
		obj.setInvoiceMark("Y");
		invoice.setRelateNumber("test202017test");
		invoice.setCustomerID("123456");
		invoice.setCarruerType("1");
		invoice.setTaxType("1");
		invoice.setCarruerNum("");
		invoice.setDonation("0");
		invoice.setLoveCode("X123456");
		invoice.setPrint("0");
		invoice.setCustomerName("Mark");
		invoice.setCustomerAddr("台北市南港區三重路");
		invoice.setCustomerPhone("0911429215");
		invoice.setDelayDay("1");
		invoice.setInvType("07");
		invoice.setInvoiceItemName("測試");
		invoice.setInvoiceItemCount("1");
		invoice.setInvoiceItemWord("個");
		invoice.setInvoiceItemPrice("50");
		invoice.setInvoiceItemTaxType("1");
		String form = all.aioCheckOut(obj, invoice);
		return form;
	}

	// 點擊購物車
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
		model.addAttribute("listCart", list);
		return "Transation/shoppingCart";
	}

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
		System.out.println("++++++++++++++++++++++++++++++++++++++++");
		System.out.println(cartNum);
		System.out.println(bksID);
		System.out.println(cartID);
		System.out.println("----------------------------------------");
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
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy/MM/dd hh:mm:ss");
		String now = sdf.format(date);
//		"2017/01/01 08:05:23"
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo("book" + qaqQty);
		obj.setMerchantTradeDate(now);
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://localhost:8080/BookWeb/bkCheckout");
		obj.setClientBackURL("http://localhost:8080/BookWeb/bkCheckout");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	@PostMapping("bkCheckout")
	public String bkCheckout() {
		return "/Transation/bkCheckout";
	}

	// 測試用
//	@PostMapping("checkout")
//	public String checkoutTest(Model model, @RequestParam String bko_Name, @RequestParam String bko_Add,
//			@RequestParam String bko_Cel) {
//		return "/Transation/bkCheckout";
//	}

}
