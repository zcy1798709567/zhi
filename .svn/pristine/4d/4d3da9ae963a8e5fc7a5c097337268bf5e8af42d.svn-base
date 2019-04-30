package com.oa.core.controller.dangjian;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName:DjHomeController
 * @author:zxd
 * @Date:2019/04/14
 * @Time:下午 7:10
 * @Version V1.0
 * @Explain
 */
@Controller
public class DjHomeController {

    @RequestMapping(value = "/djhome", method = RequestMethod.GET)
    public ModelAndView dangjianHome(String recorderNO){
        return new ModelAndView("dangjian/djhome");
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detailHome(String recorderNO){
        return new ModelAndView("dangjian/detail");
    }
}
