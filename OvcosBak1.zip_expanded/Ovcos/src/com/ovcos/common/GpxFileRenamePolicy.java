package com.ovcos.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class GpxFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		String originName = originFile.getName();
		
		// 파일 업로드 시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int ranNum = (int)(Math.random()*90000+10000);
		
		// 파일 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 최종 파일명
		String changeName = currentTime+"-f_"+ranNum+ext;
		
		return new File(originFile.getParent(), changeName);
	}
	
	
}
