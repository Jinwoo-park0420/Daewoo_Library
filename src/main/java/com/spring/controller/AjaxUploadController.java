package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.AttachFileVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@PostMapping("/uploadAjax")
	public ResponseEntity<List<AttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("파일 업로드 요청!");
		
		
		//저장 폴더 생성
		String uploadFolder="D:\\upload";
		String uploadFolderPath=getFolder(); // 2019/10/29형식으로 리턴 됨
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		List<AttachFileVO> list = new ArrayList<AttachFileVO>();
		
		for(MultipartFile multiFile:uploadFile) {
			
			//원본 파일명
			String uploadOriginalFileName=multiFile.getOriginalFilename();
			
			//IE 브라우저는 파일이 저장된 경로까지 갖고오게 되는데 불필요한 파일저장경로를 버리고 필요한 파일명만을 꺼내오기 위한 작업
			String uploadFileName=uploadOriginalFileName.substring(uploadOriginalFileName.lastIndexOf("\\")+1);
			
			//uuid생성
			UUID uuid = UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			
			//attachFileVO에 데이터 담기
			AttachFileVO vo = new AttachFileVO();
			vo.setFileName(uploadOriginalFileName);
			vo.setUploadPath(uploadFolderPath);
			vo.setUuid(uuid.toString());
			
			try {
				//파일 지정될 곳, 파일명
				File saveFile = new File(uploadPath, uploadFileName);
		//이미지 여부 판단
				if(checkType(saveFile)) {
					
					//업로드하는 파일이 이미지라면 썸네일 이미지 생성하기				
					FileOutputStream stream=new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					InputStream in=multiFile.getInputStream();
					Thumbnailator.createThumbnail(in,stream, 100, 100);
					in.close();
					stream.close();
				}
				//서버에 저장
				multiFile.transferTo(saveFile);				
				//서버에 저장된 파일의 정보를 List에 추가
				
				list.add(vo);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		
		return new ResponseEntity<List<AttachFileVO>>(list,HttpStatus.OK);
	}
	
	//썸네일 이미지를 가져와서 보여주기
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("썸네일 이미지 요청 : "+fileName);
		File file=new File("d:\\upload\\"+fileName);
		
		ResponseEntity<byte[]> entity=null;
		
		HttpHeaders headers=new HttpHeaders();
		
		try {
			headers.add("Content-Type", 
					Files.probeContentType(file.toPath()));
			entity=new ResponseEntity<byte[]>
			(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
		} catch (IOException e) {			
			e.printStackTrace();
		}
		return entity;
	}
	
	
	//.서버에서 첨부파일 삭제하기
	@PostMapping("/deleteFile")
	public ResponseEntity<String> daleteFile(String fileName,String type){
			log.info("파일삭제"+fileName);
			File file=null;
			try {
				file=new File("d:\\upload\\"+URLDecoder.decode(fileName,"utf-8"));
				file.delete();
				
				if(type.equals("image")) {
					String oriName=file.getAbsolutePath().replace("s_","");
					file=new File(oriName);
					file.delete();
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				
			}
	return new ResponseEntity<String>("deleted",HttpStatus.OK);	
	}
	
	
	//폴더 생성을 위한 폴더명 만들기
	private String getFolder() {
		log.info("폴더명 생성");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date=new Date();
		String str=format.format(date);
		return str.replace("-", File.separator);
	}
	
	
	//첨부된 파일 타입 확인하기
	private boolean checkType(File file) {
		
		try {
			// MIME 타입 판단 - 확장자를 이용			
			// .log  => null 반환
			String contentType=Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {			
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/download")
	public ResponseEntity<Resource> downloadFile(String fileName,@RequestHeader("User-Agent") String userAgent) {
		log.info("파일 다운로드 요청 "+fileName);
		
		Resource resource=
				new FileSystemResource("d:\\upload\\"+fileName);
		
		//uuid_파일명
		String resourceOriName=resource.getFilename();
		//uuid제거
		String resourceName=resourceOriName.substring(resourceOriName.indexOf("_")+1);
		HttpHeaders headers=new HttpHeaders();
		try {
			String downloadName=null;
			
			//브라우저별  한글 파일명 해결
			if(userAgent.contains("Trident")) {
				downloadName=URLEncoder.encode(resourceName,"utf-8").replaceAll("\\+", " ");
			}else if(userAgent.contains("Edge")) {
				downloadName=URLEncoder.encode(resourceName,"utf-8");
			}else {
				downloadName=new String(resourceName.getBytes("utf-8"),"ISO-8859-1");
			}			
			headers.add("Content-Disposition","attachment;fileName="+downloadName);
		
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource,headers,HttpStatus.OK);
	}
	@RequestMapping(value="/AjaxUploadController/download")
	public void fileDownload( HttpServletResponse response, HttpServletRequest request, @RequestParam Map<String, String> paramMap) {
		log.info("파일다운로드");
		String path = paramMap.get("filePath"); //full경로
		    String fileName = paramMap.get("fileName"); //파일명
		 System.out.println("경로"+path+"파일명"+ fileName);
		    File file = new File(path);
		 
		    FileInputStream fileInputStream = null;
		    ServletOutputStream servletOutputStream = null;
		 
		    try{
		        String downName = null;
		        String browser = request.getHeader("User-Agent");
		        //파일 인코딩
		        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
		             
		            downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		             
		        }else{
		             
		            downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		             
		        }
		         
		        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
		        response.setContentType("application/octer-stream");
		        response.setHeader("Content-Transfer-Encoding", "binary;");
		 
		        fileInputStream = new FileInputStream(file);
		        servletOutputStream = response.getOutputStream();
		 
		        byte b [] = new byte[1024];
		        int data = 0;
		 
		        while((data=(fileInputStream.read(b, 0, b.length))) != -1){
		             
		            servletOutputStream.write(b, 0, data);
		             
		        }
		 
		        servletOutputStream.flush();//출력
		         
		    }catch (Exception e) {
		        e.printStackTrace();
		    }finally{
		        if(servletOutputStream!=null){
		            try{
		                servletOutputStream.close();
		            }catch (IOException e){
		                e.printStackTrace();
		            }
		        }
		        if(fileInputStream!=null){
		            try{
		                fileInputStream.close();
		            }catch (IOException e){
		                e.printStackTrace();
		            }
		        }
		    }
		}
	}