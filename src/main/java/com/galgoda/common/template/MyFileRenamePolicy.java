package com.galgoda.common.template;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File arg0) {
		
		// 파일명 수정작업하는 구문 작성하기. 
		
		String originName = arg0.getName();
		
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = "galgoda_" + currentTime + ranNum + ext ;
		
		
		return new File(arg0.getParent(), changeName);
	}

}
