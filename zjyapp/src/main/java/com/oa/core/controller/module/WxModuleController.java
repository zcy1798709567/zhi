package com.oa.core.controller.module;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName:WxModuleController
 * @author:zxd
 * @Date:2019/04/09
 * @Time:下午 12:10
 * @Version V1.0
 * @Explain
 */
@Controller
@RequestMapping("/weixin")
public class WxModuleController {

    @RequestMapping(value = "/module/rizhi", method = RequestMethod.GET)
    public String rizhiViewpage(HttpServletRequest request) {
        String userid = request.getParameter("userid");
        String temp = request.getParameter("temp");
        if(temp!=null && temp.equals("ios")) {
                return "redirect:/views/module/ios/WorkDiary.html?userid="+userid;
        }else{
            return "redirect:/views/module/android/WorkDiary.html?userid="+userid;
        }
    }
    @RequestMapping(value = "/module/wendang", method = RequestMethod.GET)
    public String wendangViewpage(HttpServletRequest request) {
        String userid = request.getParameter("userid");
        String temp = request.getParameter("temp");
        if(temp!=null && temp.equals("ios")) {
            return "redirect:/views/module/ios/FileList.html?userid="+userid;
        }else{
            return "redirect:/views/module/android/FileList.html?userid="+userid;
        }
    }
    @RequestMapping(value = "/module/gongzuo", method = RequestMethod.GET)
    public String gongzuoViewpage(HttpServletRequest request) {
        String userid = request.getParameter("userid");
        String temp = request.getParameter("temp");
        if(temp!=null && temp.equals("ios")) {
            return "redirect:/views/module/ios/WorkForm.html?userid="+userid+"&formid=rcap2019040900001";
        }else{
            return "redirect:/views/module/android/WorkForm.html?userid="+userid+"&formid=rcap2019040900001";
        }
    }
    @RequestMapping(value = "/workflow/workflowproc", method = RequestMethod.GET)
    public String procViewpage(HttpServletRequest request) {
        String userid = request.getParameter("userid");
        String temp = request.getParameter("temp");
        if(temp!=null && temp.equals("ios")) {
            return "redirect:/views/module/ios/ProcTable.html?userid="+userid+"&formid=rcap2019040900001";
        }else{
            return "redirect:/views/module/android/ProcTable.html?userid="+userid+"&formid=rcap2019040900001";
        }
    }
    @RequestMapping(value = "/filetype/gotofiletype", method = RequestMethod.GET)
    public String filetypeViewpage(HttpServletRequest request) {
        String userid = request.getParameter("userid");
        String temp = request.getParameter("temp");
        if(temp!=null && temp.equals("ios")) {
            return "redirect:/views/module/ios/FileTypeTable.html?userid="+userid+"&formid=rcap2019040900001";
        }else{
            return "redirect:/views/module/android/FileTypeTable.html?userid="+userid+"&formid=rcap2019040900001";
        }
    }
}
