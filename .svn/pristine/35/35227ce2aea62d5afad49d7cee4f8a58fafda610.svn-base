package com.oa.core.controller.system;

import com.oa.core.bean.Loginer;
import com.oa.core.bean.module.Message;
import com.oa.core.bean.module.Schedule;
import com.oa.core.bean.system.TaskSender;
import com.oa.core.helper.DateHelper;
import com.oa.core.helper.StringHelper;
import com.oa.core.service.module.MessageService;
import com.oa.core.service.module.ScheduleService;
import com.oa.core.service.system.TaskSenderService;
import com.oa.core.service.util.TableService;
import com.oa.core.util.AccessUtil;
import com.oa.core.util.MySqlUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

/**
 * @ClassName:HomePageController
 * @author:zxd
 * @Date:2019/04/14
 * @Time:下午 5:44
 * @Version V1.0
 * @Explain
 */
@Controller
public class HomePageController {

    @Autowired
    TaskSenderService taskSenderService;
    @Autowired
    MessageService messageService;
    @Autowired
    TableService tableService;
    @Autowired
    ScheduleService scheduleService;
    @RequestMapping(value = "/oahome", method = RequestMethod.GET)
    public ModelAndView oahomePage(HttpServletRequest request) {
        return new ModelAndView("oahome");
    }
    @RequestMapping(value = "/home/homepage", method = RequestMethod.GET)
    public ModelAndView homePage(HttpServletRequest request) {
        Loginer loginer = (Loginer) request.getSession().getAttribute("loginer");
        String userId = loginer.getId();

        String date = DateHelper.getYMD();
        Schedule schedule = new Schedule();
        schedule.setUser(userId);
        schedule.setStartTime(date+" 23:59:59");
        schedule.setEndTime(date);
        List<Schedule> scheduleList = scheduleService.getUserSchedule(schedule);
        if(scheduleList.size()>8){
            scheduleList = scheduleList.subList(0,8);
        }
        //查询任务列表
        List<TaskSender> taskSenderList = taskSenderService.selectByHome(userId);
        //查询消息列表
        Message m = new Message();
        m.setMsgRecUser(loginer.getId());
        m.setMsgStatus(1);
        List<Message> messageList = messageService.selectAllTerms(m);
        if(messageList.size()>8){
            messageList = messageList.subList(0,8);
        }

        //查询通知公告列表
        List<String> field = new ArrayList<>();
        field.add("bt18111000001");
        field.add("nr18111000001");
        field.add("xzdwj18111002");
        field.add("tzggl18111002");
        field.add("recordTime");
        List<String> where = new ArrayList<String>();
        where.add("tzggl18111002='通知'");
        String sql = MySqlUtil.getSql(field, "tzgg181110001", where);
        List<Map<String,Object>> tzList = tableService.selectSqlMapList(sql);
        if(tzList.size()>8){
            tzList = tzList.subList(0,8);
        }
        List<String> where1 = new ArrayList<String>();
        where1.add("tzggl18111002='公告'");
        String sql1 = MySqlUtil.getSql(field, "tzgg181110001", where1);
        List<Map<String,Object>> ggList = tableService.selectSqlMapList(sql1);
        if(ggList.size()>8){
            ggList = ggList.subList(0,8);
        }

        if(ggList.size()>12){
            ggList = ggList.subList(0,12);
        }

        Vector<String> fields1 = StringHelper.string2Vector("recorderNO,dxr1904140001;rqxz190414001;xwbt190414001;dxwb190414001;dwjsc19041401;xwgj190414001;",";");
        String sqlxinwen = MySqlUtil.getFieldSql(fields1, "xwtz190414001", null, "recordTime desc");
        Vector<String> fields2 = StringHelper.string2Vector("recorderNO,zxbt190414001;zxnr190414001;zxrq190414001;zxtp190414001;zxwj190414001;",";");
        String sqldangqun = MySqlUtil.getFieldSql(fields2, "dnzx190414001", null, "recordTime desc");
        List<Map<String,Object>> xinwen = tableService.selectSqlMapList(sqlxinwen);
        List<Map<String,Object>> dangqun = tableService.selectSqlMapList(sqldangqun);

        List<Map<String,Object>> usermenu = AccessUtil.getUserMenuValue(userId);
        ModelAndView mav = new ModelAndView("homepage");
        mav.addObject("taskSenderList", taskSenderList);
        mav.addObject("messageList", messageList);
        mav.addObject("scheduleList", scheduleList);
        mav.addObject("tzList", tzList);
        mav.addObject("ggList", ggList);
        mav.addObject("xinwen", xinwen);
        mav.addObject("dangqun", dangqun);
        mav.addObject("usermenu", usermenu);
        return mav;
    }


    @RequestMapping(value = "/chathome", method = RequestMethod.GET)
    public ModelAndView gotoChatHome(){
        return new ModelAndView("chitchat/chathome");
    }
}
