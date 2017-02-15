package com.future.action;

import com.future.base.BaseController;
import com.future.domain.Entry;
import com.future.domain.IncomeRecord;
import com.future.domain.Union;
import com.future.domain.User;
import com.future.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by 牛洧鹏 on 2017/1/15.
 */
@Controller
@Scope("prototype")
@RequestMapping("incomerecord")
@SessionAttributes("user")
public class IncomeRecordController extends BaseController{

    /**
     * 进入拨款的页面
     * @return
     */
    @RequestMapping(value = "/incomerecordview")
    public ModelAndView incomerecordview(HttpSession session){
        /*模拟User*/
        User user = (User) session.getAttribute("user");
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
    public ModelAndView add(IncomeRecord incomeRecord,HttpSession session){
        User user = (User) session.getAttribute("user");
        incomeRecord.setIr_date(new Date());
        incomeRecord.setIr_user(user);
        ModelAndView modelAndView = new ModelAndView();
        Union union = unionService.findById(incomeRecord.getIr_union().getUn_id());
        Double inmoney = incomeRecordService.sumMoney(incomeRecord.getIr_union().getUn_id());
        Double exmoney = eRecordService.sumExMoney(incomeRecord.getIr_union().getUn_id());
        if (exmoney == null) exmoney = 0.00;
        try {
            incomeRecordService.add(incomeRecord);
            modelAndView.addObject("message",union.getUn_name()+"拨款"+incomeRecord.getIr_money()+"元成功,还剩余"+(inmoney-exmoney));
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

    /**
     * 查询所有拨款记录
     */
    @RequestMapping(value="getAllIncomeRecord/{currentPage}",method = RequestMethod.GET)
    public ModelAndView getAllIncomeRecord(@PathVariable("currentPage") Integer currentPage){
        String viewname = "IncomeRecordViews/getAllIncomeRecord";
        ModelAndView modelAndView = new ModelAndView(viewname);
        PageBean pageBean = PageBean.getDefault();
        pageBean.setCurrentPage(currentPage);
        pageBean = incomeRecordService.getAllIncomeRecord(pageBean);
        pageBean.calbeginAndEnd();
        modelAndView.addObject("pageBean",pageBean);
        Double incomeSumMonsy = incomeRecordService.getAllincomeSumMonsy();
        modelAndView.addObject("incomeSumMonsy",incomeSumMonsy);
        //准备数据，工会和条目   拨款条目
        List<Entry> entryList = entryService.getAllIncomeEntry();
        List<Union> unionList = unionService.findAll();
        modelAndView.addObject("entryList",entryList);
        modelAndView.addObject("unionList",unionList);
        return modelAndView;
    }

    /**
     * 条件查询拨款
     */
    @RequestMapping(value="getConditionIncomeRecord/{currentPage}",method = RequestMethod.POST)
    public ModelAndView getConditionIncomeRecord(@PathVariable("currentPage") Integer currentPage,
                                                 @RequestParam(value="date1",required = false) String date1,
                                                 @RequestParam(value="date2",required = false) String date2,
                                                 @RequestParam(value="un_id",required = false) Integer un_id,
                                                 @RequestParam(value="en_id",required = false) Integer en_id){
        String viewname="IncomeRecordViews/getConditionIncomeRecord";
        ModelAndView modelAndView = new ModelAndView(viewname);
        PageBean pageBean = PageBean.getDefault();
        pageBean.setCurrentPage(currentPage);
        pageBean = incomeRecordService.getConditionIncomeRecord(pageBean,date1,date2,un_id,en_id);
        pageBean.calbeginAndEnd();
        modelAndView.addObject("pageBean",pageBean);
        Double incomeSumMonsy = incomeRecordService.getConditionIncomeRecordSumMoney(date1,date2,un_id,en_id);
        modelAndView.addObject("incomeSumMonsy",incomeSumMonsy);
        //准备数据，工会和条目
        List<Entry> entryList = entryService.getAllExpenEntry();
        List<Union> unionList = unionService.findAll();
        modelAndView.addObject("entryList",entryList);
        modelAndView.addObject("unionList",unionList);
        //放入原本起止日期，工会，条目
        modelAndView.addObject("date11",date1);
        modelAndView.addObject("date22",date2);
        modelAndView.addObject("un_id",un_id);
        modelAndView.addObject("en_id",en_id);
        return modelAndView;
    }
}
