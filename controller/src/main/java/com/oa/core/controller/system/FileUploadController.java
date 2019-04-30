package com.oa.core.controller.system;

import com.oa.core.helper.DateHelper;
import com.oa.core.util.ConfParseUtil;
import com.oa.core.util.LogUtil;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

/**
 * @ClassName:FileUploadController
 * @author:zxd
 * @Date:2018/10/16
 * @Time:下午 3:48
 * @Version V1.0
 * @Explain
 */

@Controller
@RequestMapping("/upload")
public class FileUploadController {

    @RequestMapping(value = "/fileupload", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String uploadImg(HttpServletRequest request, MultipartFile file) {
        String type = request.getParameter("type");
        if(type==null || type==""){
            type = "temp";
        }
        JSONObject jsonObject = new JSONObject();
        if (null != file) {
            String myFileName = file.getOriginalFilename();
            String fileName =  DateHelper.timeNum() +"-"+ myFileName;
            String sqlPath="upload/"+type+"/"+DateHelper.getYearMonth()+"/";
            File fileDir=new File(getFile()+sqlPath);
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }
            String path=getFile()+sqlPath+fileName;
            File localFile = new File(path);
            try {
                file.transferTo(localFile);
                jsonObject.put("code",1);
                jsonObject.put("file",sqlPath+fileName);
            } catch (IllegalStateException e) {
                jsonObject.put("code",0);
                e.printStackTrace();
            } catch (IOException e) {
                jsonObject.put("code",0);
                e.printStackTrace();
            }
        }else{
            LogUtil.sysLog("文件为空");
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "/fileuploads", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String webUploadFile(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type");
        if(type==null || type==""){
            type = "temp";
        }
        JSONObject jsonObject = new JSONObject();
        //创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断 request 是否有文件上传,即多部分请求
        if(multipartResolver.isMultipart(request)){
            //转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            //取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            try {
                String fileNames = "";
                while(iter.hasNext()){
                    //取得上传文件
                    MultipartFile file = multiRequest.getFile(iter.next());
                    if(file != null){
                        //取得当前上传文件的文件名称
                        String myFileName = file.getOriginalFilename();
                        //如果名称不为“”,说明该文件存在，否则说明该文件不存在
                        if(myFileName.trim() !=""){
                            LogUtil.sysLog(myFileName);
                            //重命名上传后的文件名  增加时间戳前缀
                            String fileName = DateHelper.timeNum() +"-"+ myFileName;
                            //定义上传路径
                            String sqlPath="upload/"+type+"/"+DateHelper.getYearMonth()+"/";
                            File fileDir=new File(getFile()+sqlPath);
                            if (!fileDir.exists()) {
                                fileDir.mkdirs();
                            }
                            String path=getFile()+sqlPath+fileName;
                            //存文件
                            File localFile = new File(path);
                            file.transferTo(localFile);
                            fileNames = sqlPath+fileName;
                        }
                    }
                }
                jsonObject.put("code", 1);
                jsonObject.put("file",fileNames);
            } catch (IllegalStateException e) {
                LogUtil.sysLog(e);
                e.printStackTrace();
                jsonObject.put("code", 0);
            } catch (IOException e) {
                LogUtil.sysLog(e);
                e.printStackTrace();
                jsonObject.put("code", 0);
            }
        }
        LogUtil.sysLog(jsonObject);
        return jsonObject.toString();
    }

    public static String getFile(){
        ConfParseUtil cp = new ConfParseUtil();
        String file = cp.getProperty("upload_file");
        return file;
    }
}
