package com.cdu.edu.sportmall.utils;

import sun.misc.BASE64Encoder;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import static jdk.nashorn.internal.objects.Global.undefined;

public class BlobUtils {

    public static String convertBlobToBase64String(Blob blob) {
        String result = "";
        if(null != blob) {
            try {
                InputStream msgContent = blob.getBinaryStream();
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[100];
                int n = 0;
                while (-1 != (n = msgContent.read(buffer))) {
                    output.write(buffer, 0, n);
                }
                result =new BASE64Encoder().encode(output.toByteArray()) ;
                output.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        }else {
            return null;
        }
    }
}
