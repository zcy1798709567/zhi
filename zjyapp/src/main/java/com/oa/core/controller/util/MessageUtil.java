package com.oa.core.controller.util;

import com.oa.core.example.JPushAllService;
import com.oa.core.helper.StringHelper;
import org.junit.Test;

import fr.opensagres.xdocreport.document.json.JSONArray;

import java.util.ArrayList;
import java.util.Vector;

/**
 * @ClassName:MessageUtil
 * @author:zxd
 * @Date:2019/04/11
 * @Time:下午 4:17
 * @Version V1.0
 * @Explain
 */
public class MessageUtil {

    public static String addArticle(String users, String msg) {
        ArrayList<String> list = new ArrayList<String>(0);
        Vector<String> vuser = StringHelper.string2Vector(users, ";");
        if (users != null && !users.equals("")) {
            for (int i = 0, len = vuser.size(); i < len; i++) {
                list.add(vuser.get(i));
            }
        }
        String url = "/task/tasksendpage.do?procId=FlowTask2019041400004&wkflwId=tysplc2018110700002&nodeId=txspnr2018110700001&workOrderNO=ZA2019041400007";
        //调用ios的
        JPushAllService.jpushIOS(list, msg, url);
        //然后调用安卓的
        JPushAllService.jpushAndroid2(list, msg, url);
        return "1";
    }

    @Test
    public void test() {
        addArticle("admin;zhenxudong", "请处理管理员发起的流程审批！");
    }
}
