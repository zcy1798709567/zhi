package com.oa.core.controller.system;

import com.oa.core.bean.Loginer;
import com.oa.core.bean.module.Department;
import com.oa.core.interceptor.Logined;
import com.oa.core.service.module.DepartmentService;
import com.oa.core.util.DeptUtil;
import com.oa.core.util.MenuUtil;
import com.oa.core.util.ToNameUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName:ChitChatController
 * @author:zxd
 * @Date:2019/04/16
 * @Time:上午 9:35
 * @Version V1.0
 * @Explain
 */
@Controller
@RequestMapping("/cc")
public class ChitChatController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping(value = "/getuserlist", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getUserList(HttpServletRequest request) {
        Loginer loginer = (Loginer) request.getSession().getAttribute("loginer");
        String userid = "", username = "";
        if (loginer == null) {
            userid = request.getParameter("userid");
            username = ToNameUtil.getName("user", userid);
        } else {
            userid = loginer.getId();
            username = loginer.getName();
        }

        JSONObject json = new JSONObject();
        try {
            JSONObject data = new JSONObject();
            JSONObject mine = new JSONObject();
            mine.put("username", username);
            mine.put("id", userid);
            mine.put("status", "online");
            mine.put("sign", "努力工作快乐生活");
            mine.put("avatar", "");
            data.put("mine", mine);

            List<Department> myurllist = departmentService.selectAll();
            JSONArray userList = new JSONArray(DeptUtil.getMenu(myurllist, true, true, true));
            JSONArray friend = new JSONArray();
            int num = 0;
            for (int i = 0, len = userList.length(); i < len; i++) {
                JSONObject jsonObject = userList.getJSONObject(i);
                friend.put(num, getDept(jsonObject, num));
                JSONArray children = jsonObject.getJSONArray("children");
                num++;
                if (children.length() > 0) {
                    for (int c = 0, clen = children.length(); c < clen; c++) {
                        JSONObject cjsonObject = children.getJSONObject(c);
                        friend.put(num, getDept(cjsonObject, num));
                        num++;
                    }
                }
            }
            JSONObject list = new JSONObject();
            list.put("mine",mine);
            list.put("friend",friend);
            json.put("code", 0);
            json.put("success", 1);
            json.put("msg", "");
            json.put("data", list);
        } catch (Exception e) {
            e.getLocalizedMessage();
            json.put("code", 1);
            json.put("success", 0);
            json.put("msg", "获取失败");
        }
        return json.toString();
    }

    public JSONObject getDept(JSONObject jsonObject, int num) {
        JSONObject group = new JSONObject();
        group.put("groupname", jsonObject.getString("name"));
        group.put("id", jsonObject.getString("id"));
        group.put("online", num);
        group.put("list", getEmp(jsonObject.getJSONArray("empName")));
        return group;
    }

    public JSONArray getEmp(JSONArray empname) {
        JSONArray emplist = new JSONArray();
        for (int i = 0, len = empname.length(); i < len; i++) {
            JSONObject e = empname.getJSONObject(i);
            JSONObject emp = new JSONObject();
            emp.put("username", e.getString("staffName"));
            emp.put("id", e.getString("userName"));
            emp.put("status", "online");
            emp.put("sign", "努力工作快乐生活");
            emp.put("avatar", "");
            emplist.put(i, emp);
        }
        return emplist;
    }
}
