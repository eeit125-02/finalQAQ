package com.web.book.service;

import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.web.book.model.MemberBean;

public class GlobalService {	
	
	static MemberBean loginMember;
	
	public static final String SYSTEM_NAME ="";
	
	private static final String SESSION_ID = "SessionID";
	
	
	private GlobalService() {
		
	}
	
	public static MemberBean getLoginMember() {
		return loginMember;
	}

	public static void setLoginMember(MemberBean loginMember) {
		GlobalService.loginMember = loginMember;
	}

	public static String getMemberEncoder (String passwordString) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(passwordString);
	}
	
	public static Boolean checkMemberEncoder(String checkMemberPassword , String loginMemberPassword){
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(checkMemberPassword, loginMemberPassword);
	}
	
	public static Map<String, String> getSession(String sessionID) throws InterruptedException, ExecutionException, IOException{
		
		FirebaseService firebase = new FirebaseService();
		DocumentReference session = firebase.getFirestore().collection(SESSION_ID).document(sessionID);
		Map<String, String> sessionValue = new HashMap<>();
		DocumentSnapshot data =  session.get().get();
		sessionValue.put("id",data.getString("id"));
		sessionValue.put("name", data.getString("name"));
		sessionValue.put("account", data.getString("account"));
		return sessionValue;
	}
	
	public static String createSessionID(String id, String name, String account) throws IOException, InterruptedException, ExecutionException {
		
		FirebaseService firebase = new FirebaseService();
		
		ApiFuture<QuerySnapshot> future = firebase.getFirestore().collection(SESSION_ID).get();
		List<QueryDocumentSnapshot> documents = future.get().getDocuments();
		for (QueryDocumentSnapshot document : documents) {
			  if (document.getString("id").equals(id)) {
				  firebase.getFirestore().collection(SESSION_ID).document(document.getId()).delete();
			  }
		}
		Map<String, Object> sessionValue = new HashMap<>();
		sessionValue.put("id", id);
		sessionValue.put("name", name);	
		sessionValue.put("account", acount);
		ApiFuture<DocumentReference> addedDocRef = firebase.getFirestore().collection(SESSION_ID).add(sessionValue);
		
		return addedDocRef.get().getId();
	}
	
	public static String creatImgInFirebase(String filePath, String name, byte[] aa) throws IOException {
		
		FirebaseService firebase = new FirebaseService();
		Storage storage = firebase.getStorage().bucket().getStorage();
		BlobId blobId = BlobId.of("bookweb-50d11.appspot.com", "member/"+name+".jpg");
	    BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
	   //Blob image =  storage.create(blobInfo, Files.readAllBytes(Paths.get(filePath)));
	    
	    //Blob image = storage.create(blobInfo, aa, Files.readAllBytes(Paths.get(filePath)));
	    URL url = storage.signUrl(blobInfo, 15, TimeUnit.MINUTES, Storage.SignUrlOption.withV4Signature());
	    System.out.println(url.toString());
	    //storage.create(blobInfo, filePath, "image/jpg");
		
		return null;
	}
	

}
