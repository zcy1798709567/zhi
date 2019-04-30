package com.oa.core.controller.system;

import com.oa.core.bean.system.Attendance;
import com.oa.core.util.ConfParseUtil;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName:kaoqinController
 * @author:zxd
 * @Date:2019/03/19
 * @Time:下午 2:47
 * @Version V1.0
 * @Explain
 */
@Controller
@RequestMapping("/kaoqin")
public class AttendanceController {

    @RequestMapping(value = "/insert", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String setKaoQin(HttpServletRequest request, @RequestBody String param) {
        System.out.println(param);
        param = "{\"sdwEnrollNumber\":\"admin\",\"sName\":\"管理员\",\"year\":\"2019\",\"month\":\"03\",\"day\":\"21\",\"hour\":\"13\",\"minute\":\"30\",\"second\":\"00\"}";
        JSONObject jo = new JSONObject(param);
        System.out.println("========================>" + jo + "<======================");
        String id = jo.getString("sdwEnrollNumber");
        String name = jo.getString("sName");
        if(!jo.isNull("VerifyMethod")) {
            String type = jo.getString("VerifyMethod ");
        }
        String year = jo.getString("year");
        String month = jo.getString("month");
        String day = jo.getString("day");
        String hour = jo.getString("hour");
        String minute = jo.getString("minute");
        String second = jo.getString("second");
        Attendance attendance = new Attendance();
        attendance.setValue(id,name,year,month,day,hour,minute,second);
        ConfParseUtil cp = new ConfParseUtil();
        //上午上班
        String amtowork = year+"-"+month+"-"+day+" "+cp.getSchedule("amtowork");
        //上午下班
        String amoffwork = year+"-"+month+"-"+day+" "+cp.getSchedule("amoffwork");
        //下午上班
        String pmtowork = year+"-"+month+"-"+day+" "+cp.getSchedule("pmtowork");
        //下午下班
        String pmoffwork = year+"-"+month+"-"+day+" "+cp.getSchedule("pmoffwork");


        JSONObject jsonObject = new JSONObject();
        if(false){
            jsonObject.put("msg", "签到失败");
            jsonObject.put("success",0);
        }else {
            jsonObject.put("msg", "");
            jsonObject.put("success",1);
        }
        return jsonObject.toString();
    }
}
