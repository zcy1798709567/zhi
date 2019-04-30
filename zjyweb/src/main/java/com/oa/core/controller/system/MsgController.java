package com.oa.core.controller.system;

import com.oa.core.service.util.TableService;
import com.oa.core.util.MySqlUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName:MsgController
 * @author:zxd
 * @Date:2019/04/14
 * @Time:下午 7:08
 * @Version V1.0
 * @Explain
 */
public class MsgController {
    @Autowired
    TableService tableService;

    @RequestMapping("/seeTzggInfo")
    public ModelAndView seeTzggInfo(String recorderNO){
        ModelAndView mav = new ModelAndView("module/tzggInfo");
        List<String> field = new ArrayList<>();
        field.add("bt18111000001");
        field.add("nr18111000001");
        field.add("xzdwj18111002");
        field.add("tzggl18111002");
        field.add("xzdwj18111002");
        field.add("recordTime");
        List<String> where = new ArrayList<String>();
        where.add("recorderNO='" + recorderNO + "'");
        String sql = MySqlUtil.getSql(field,"tzgg181110001", where);
        Map<String, Object> sqlvalue = tableService.selectSqlMap(sql);
        String files = (String)sqlvalue.get("xzdwj18111002");
        List<Map<String,Object>> fileLsit = new ArrayList<>();
        if(files!=null&&!files.equals("")){
            String[] msgFiles = files.split("\\|");
            for(String file : msgFiles){
                Map<String,Object> map = new HashMap<>();
                String[] fileName = file.split("-");
                map.put("fileName",fileName[1]);
                map.put("file",file);
                fileLsit.add(map);
            }
        }
        mav.addObject("tzgg",sqlvalue);
        mav.addObject("fileLsit",fileLsit);
        return mav;
    }
}
