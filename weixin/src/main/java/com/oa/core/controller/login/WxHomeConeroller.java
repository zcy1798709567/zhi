package com.oa.core.controller.login;

import com.oa.core.bean.Loginer;
import com.oa.core.bean.module.Message;
import com.oa.core.bean.system.TaskSender;
import com.oa.core.bean.util.PageUtil;
import com.oa.core.controller.util.LoginUtil;
import com.oa.core.interceptor.Logined;
import com.oa.core.service.module.MessageService;
import com.oa.core.service.module.ScheduleService;
import com.oa.core.service.system.TaskSenderService;
import com.oa.core.service.util.TableService;
import com.oa.core.util.LogUtil;
import com.oa.core.util.MenuUtil;
import com.oa.core.util.MySqlUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/weixin")
public class WxHomeConeroller {
    @Autowired
    TaskSenderService taskSenderService;
    @Autowired
    MessageService messageService;
    @Autowired
    TableService tableService;
    @Autowired
    ScheduleService scheduleService;

    @RequestMapping(value = "/home", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String home(HttpServletRequest request, String date) {
        JSONObject json = new JSONObject();
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userid");
        //查看任务
        List<TaskSender> taskSender = taskSenderService.selectUser("'" + userId + "'");
        try {
            Message m = new Message();
            m.setMsgRecUser(userId);
            m.setMsgStatus(1);
            //查询消息
            List<Message> msgList = messageService.selectAllTerms(m);
            int msgcont = messageService.selectAllTermsCont(m);
            //查询通知
            List<String> where = new ArrayList<>();
            where.add("tzggl18111002='通知'");
            String countSql1 = MySqlUtil.getCountSql("tzgg181110001", where);
            int count1 = tableService.selectSqlCount(countSql1);
            //查询公告
            where = new ArrayList<>();
            where.add("tzggl18111002='公告'");
            String countSql2 = MySqlUtil.getCountSql("tzgg181110001", where);
            int count2 = tableService.selectSqlCount(countSql2);
            //查询日程列表
            String sql = " select * from schedule \n" +
                    "               where user = '" + userId + "' and curStatus = 2\n" +
                    "               and DATE_FORMAT(startTime,'%Y-%m-%d') <= '" + date + "'\n" +
                    "               and DATE_FORMAT(endTime,'%Y-%m-%d') >= '" + date + "' ORDER BY startTime LIMIT 5;";
            List<Map<String, Object>> taskList = tableService.selectSqlMapList(sql);

            json.put("taskList", taskList);
            json.put("taskNum", taskList.size());
            json.put("tzNum", count1);
            json.put("ggNum", count2);
            json.put("msgNum", msgcont);
            json.put("msglist", msgList);

            jsonObject.put("success", 1);
        } catch (Exception e) {
            LogUtil.sysLog("Exception:" + e);
            jsonObject.put("success", 0);
        }

        json.put("taskNum", taskSender.size());
        if (taskSender.size() > 0) {
            Timestamp recordTime = taskSender.get(0).getRecordTime();
            String time = CalculateTime(recordTime.toString());
            json.put("time", time);
        }
        JSONObject url = new JSONObject();
        url.put("wendang", "/module/wendang.do");
        url.put("rizhi", "/module/rizhi.do");
        url.put("gongzuo", "/module/gongzuo.do");
        jsonObject.put("data", json);
        jsonObject.put("url", url);
        return jsonObject.toString();
    }

    public String CalculateTime(String time) {
        long nowTime = System.currentTimeMillis(); // 获取当前时间的毫秒数
        String msg = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 指定时间格式
        Date setTime = null; // 指定时间
        try {
            setTime = sdf.parse(time); // 将字符串转换为指定的时间格式
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long reset = setTime.getTime(); // 获取指定时间的毫秒数
        long dateDiff = nowTime - reset;
        if (dateDiff < 0) {
            msg = "输入的时间不对";
        } else {
            long dateTemp1 = dateDiff / 1000; // 秒
            long dateTemp2 = dateTemp1 / 60; // 分钟
            long dateTemp3 = dateTemp2 / 60; // 小时
            long dateTemp4 = dateTemp3 / 24; // 天数
            long dateTemp5 = dateTemp4 / 30; // 月数
            long dateTemp6 = dateTemp5 / 12; // 年数
            if (dateTemp6 > 0) {
                msg = dateTemp6 + "年前";
            } else if (dateTemp5 > 0) {
                msg = dateTemp5 + "个月前";
            } else if (dateTemp4 > 0) {
                msg = dateTemp4 + "天前";
            } else if (dateTemp3 > 0) {
                msg = dateTemp3 + "小时前";
            } else if (dateTemp2 > 0) {
                msg = dateTemp2 + "分钟前";
            } else if (dateTemp1 > 0) {
                msg = "刚刚";
            }
        }
        return msg;
    }

    @RequestMapping(value = "/selectusertask", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String selectUserTask(HttpServletRequest request, String inputval, String option, int limit, int page) {
        String userId = request.getParameter("userid");
        TaskSender taskSender = new TaskSender();
        if (inputval != null && inputval != "") {
            if ("taskTitle".equals(option)) {
                taskSender.setTaskTitle(inputval);
            } else if ("modifyName".equals(option)) {
                taskSender.setModifyName(inputval);
            }
        }
        taskSender.setAccepter(userId);
        int count = taskSenderService.selectTermsCount(taskSender);
        PageUtil pageUtil = new PageUtil();
        pageUtil.setPageSize(limit);
        pageUtil.setCurrentPage(page);
        taskSender.setStartRow(pageUtil.getStartRow());
        taskSender.setEndRow(pageUtil.getEndRow() - pageUtil.getStartRow());
        List<TaskSender> taskSenderList = taskSenderService.selectTerms(taskSender);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", count);
        jsonObject.put("data", taskSenderList);
        jsonObject.put("success", 1);
        return jsonObject.toString();
    }
}
