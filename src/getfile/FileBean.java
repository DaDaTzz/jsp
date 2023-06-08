package getfile;

import java.util.ArrayList;
import java.util.List;
import java.io.File;

public class FileBean {
    private String dPah;
    private String suffix;
    private List<File> fileList = new ArrayList<>();

    /**
     * 根据路径和扩展名获取文件列表
     */
    public void getFile(){
        File d = new File(dPah);
        ArrayList<File> list = new ArrayList<>();
        if(d.exists() && d.isDirectory()){
            File[] files = d.listFiles();
            for (File file : files) {
                if(file.isFile()){
                    String fileName = file.getName();
                    if(fileName.endsWith(suffix)){
                        list.add(file);
                    }
                }
            }
        }
        fileList = list;

    }

    public FileBean() {
    }

    public FileBean(String dPah, String suffix, List<File> fileList) {
        this.dPah = dPah;
        this.suffix = suffix;
        this.fileList = fileList;
    }

    public String getdPah() {
        return dPah;
    }

    public void setdPah(String dPah) {
        this.dPah = dPah;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public List<File> getFileList() {
        return fileList;
    }

    public void setFileList(List<File> fileList) {
        this.fileList = fileList;
    }

}
