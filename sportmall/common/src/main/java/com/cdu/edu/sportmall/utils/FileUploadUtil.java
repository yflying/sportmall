package com.cdu.edu.sportmall.utils;



import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @author Glenn
 */
public class FileUploadUtil {
    public static String saveFile(MultipartFile multipartFile, String path) throws IOException {
        // 获取文件名后缀
        String originalFilename = multipartFile.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        // 生成唯一文件名
        String filename = UUID.randomUUID().toString().replaceAll("-", "") + suffix;
        // 创建文件实例
        File file = new File(path, filename);
        // 写入磁盘
        multipartFile.transferTo(file);
        // 返回文件名
        return filename;
    }
}
