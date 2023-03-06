package com.ovcos.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * 대회 이미지 이름설정
 * @author user1
 *
 */
public class ContestFileRenamePolicy implements FileRenamePolicy {
	
	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName(); 
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + "-contest_" + ranNum + ext;
		
		return new File(originFile.getParent(), changeName);
	}
	
}
