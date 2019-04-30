package com.oa.core.controller.system;

import com.oa.core.bean.Loginer;
import com.oa.core.bean.user.UserComputer;
import com.oa.core.interceptor.Logined;
import com.oa.core.service.user.UserComputerService;
import com.oa.core.util.MenuUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName:MenuComtroller
 * @author:zxd
 * @Date:2019/04/14
 * @Time:下午 2:34
 * @Version V1.0
 * @Explain
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    UserComputerService userComputerService;

    @Logined
    @RequestMapping(value = "/getmenudata", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getMenuData(HttpServletRequest request) {
        Loginer loginer = (Loginer) request.getSession().getAttribute("loginer");
        JSONArray userMenu = null;
        if (loginer != null) {
            String userId = loginer.getId();
            MenuUtil mu = new MenuUtil();
            userMenu = mu.getMenuByJson(userId);
        }
        return userMenu.toString();
    }
}
