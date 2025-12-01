package util;

import java.io.*;

public class FileUtil {
    public static void saveImage(String root, String fname, byte[] data) throws IOException {
        File dir = new File(root, "images");
        if (!dir.exists()) dir.mkdirs();


        File f = new File(dir, fname);
        try (FileOutputStream out = new FileOutputStream(f)) {
            out.write(data);
        }
    }
}