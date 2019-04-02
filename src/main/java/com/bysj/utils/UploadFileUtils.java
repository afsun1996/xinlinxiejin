package com.bysj.utils;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class UploadFileUtils {

	public static void saveFile(HttpServletRequest request ,String oldFilePath) throws IllegalStateException, IOException {
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
				CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
						request.getSession().getServletContext());
				// 检查form中是否有enctype="multipart/form-data"
				if (multipartResolver.isMultipart(request)) {
					// 将request变成多部分request
					MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
					// 获取multiRequest 中所有的文件名
					Iterator iter = multiRequest.getFileNames();
					while (iter.hasNext()) {
						// 一次遍历所有文件
						MultipartFile file = multiRequest.getFile(iter.next().toString());
						if (file != null && file.getSize()!=0) {
							File oldFile = new File(oldFilePath);
							if(oldFile.exists()) {
								oldFile.delete();
							}
							// 上传
							file.transferTo(new File(oldFilePath));
						}

					}

				}
	}
	
}
