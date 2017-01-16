package com.future.action;

import com.future.base.BaseController;
import com.future.domain.Entry;
import com.future.domain.IncomeRecord;
import com.future.domain.Union;
import com.future.domain.User;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * Created by 牛洧鹏 on 2017/1/15.
 */
@Controller
@Scope("prototype")
@RequestMapping("incomerecord")
public class IncomeRecordController extends BaseController{

    /**
     * 进入拨款的页面
     * @return
     */
    @RequestMapping(value = "/incomerecordview")
    public ModelAndView incomerecordview(){
        /*模拟User*/
        User user = User.getDefaultUser();
        user.setUser_id(3);
        ModelAndView modelAndView = new ModelAndView();
        List<Union> unions = unionService.findAll(); //得到所有工会
        List<Entry> entries = entryService.findAll(); // 得到所有条目
        modelAndView.addObject("unions",unions);
        modelAndView.addObject("user",user);
        modelAndView.addObject("entries",entries);
        modelAndView.setViewName("/IncomeRecordViews/incomerecordview");
        return modelAndView;
    }

    @RequestMapping("/add")
    public ModelAndView add(IncomeRecord incomeRecord){
        User user = User.getDefaultUser();
        user.setUser_id(3);
        incomeRecord.setIr_date(new Date());
        incomeRecord.setIr_user(user);
        ModelAndView modelAndView = new ModelAndView();
        Union union = unionService.findById(incomeRecord.getIr_union().getUn_id());
        try {
            incomeRecordService.add(incomeRecord);
            modelAndView.addObject("message",union.getUn_name()+"拨款"+incomeRecord.getIr_money()+"元成功");
        }catch (Exception e){
            modelAndView.addObject("message","拨款失败");
        }

        List<Union> unions = unionService.findAll(); //得到所有工会
        List<Entry> entries = entryService.findAll(); // 得到所有条目
        modelAndView.addObject("unions",unions);
        modelAndView.addObject("entries",entries);
        modelAndView.setViewName("/IncomeRecordViews/incomerecordview");
        return  modelAndView;
    }
}
