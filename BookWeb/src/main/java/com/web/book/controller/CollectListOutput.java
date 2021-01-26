package com.web.book.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.BookCollectBean;
import com.web.book.model.MemberBean;
import com.web.book.service.SearchService;

@Controller
@SessionAttributes("loginUser")
public class CollectListOutput {
	
	@Autowired
	SearchService searchService;
	
	private static final String collectPath="/Users/hsin/Pictures/書適圈/myCollectList.log";
	//指定預設檔案路徑
	
	@RequestMapping(value="/download1", method = RequestMethod.GET)
	public void downloadFiletest(
			HttpServletResponse response
			,@ModelAttribute("loginUser") MemberBean loginUser
			) throws IOException {
	
//		-----------------------------------------------------------------
		
		File fileFolder = new File("/Users/hsin/Pictures/書適圈/");
		fileFolder.mkdir();//創造檔案夾位置
		
		File collectionFile=new File(collectPath);
		List<BookCollectBean> result = searchService.gotoCollect(loginUser.getMb_ID());
		String soutput = "";
		for(BookCollectBean list : result) {
			soutput = soutput+"\r\n"+"書名：《"+list.getBook().getBk_Name()
					+"》｜作者："+list.getBook().getBk_Author()
					+"｜出版社："+list.getBook().getBk_Publish()+"\r\n";
		}
		StringBuffer buf = new StringBuffer();//效果同String，但可以節省String記憶體（參考Vincent的Java課程）
		
		try (
				FileOutputStream fos = new FileOutputStream(collectionFile);
				PrintWriter pw = new PrintWriter(fos);
				){
			String content = "【收藏書單】  " + soutput;
			buf.append(content);//累加內容，不會再新創記憶體
			pw.write(buf.toString());
			pw.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}

			File file = new File(collectPath);
		
		if(!file.exists()){
			String errorMessage = "Sorry. The file you are looking for does not exist";
			System.out.println(errorMessage);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
			outputStream.close();
			return;
		}
		
		String mimeType= URLConnection.guessContentTypeFromName(file.getName());
		if(mimeType==null){
			System.out.println("mimetype is not detectable, will take default");
			mimeType = "application/octet-stream";
		}
        response.setContentType(mimeType);
        response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() +"\""));
        response.setContentLength((int)file.length());

		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
        FileCopyUtils.copy(inputStream, response.getOutputStream());
	}
}
