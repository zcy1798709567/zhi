package com.oa.core.controller.system;

import com.oa.core.bean.Loginer;
import com.oa.core.util.MenuUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName:WxMenuController
 * @author:zxd
 * @Date:2019/03/20
 * @Time:下午 3:08
 * @Version V1.0
 * @Explain 获取菜单方法
 */
@Controller
@RequestMapping("/weixin")
public class WxMenuController {

    @RequestMapping(value = "/usermenu", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getMyMenu(HttpServletRequest request,String user){
        Loginer loginer = (Loginer) request.getSession().getAttribute("loginer");
        JSONArray userMenu = null;
        if (loginer != null || user !=null) {
            String userId = user;
            if(user==null){
                userId = loginer.getId();
            }
            MenuUtil mu = new MenuUtil();
            userMenu = mu.getMenuByJson(userId);
        }
        JSONObject jsonObject = new JSONObject();
        if(userMenu==null){
            jsonObject.put("msg", "获取菜单失败");
            jsonObject.put("success",0);
        }else {
            jsonObject.put("msg", "");
            jsonObject.put("success",1);
            jsonObject.put("data",userMenu);
            jsonObject.put("title","/resources/images/menutitle.jpg");
        }
        return jsonObject.toString();
    }
}
