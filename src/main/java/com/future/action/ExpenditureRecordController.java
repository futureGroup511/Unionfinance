package com.future.action;

import com.future.base.BaseController;
import com.future.domain.Entry;
import com.future.domain.ExpenditureRecord;
import com.future.domain.Union;
import com.future.domain.User;
import com.future.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 牛洧鹏 on 2017/1/15.
 * 刘阳
 * 添加支出记录，
 * 查看所有支出，
 */
@Controller
@Scope("prototype")
@RequestMapping("expenditurerecord")
public class ExpenditureRecordController extends BaseController {

    /**
     * 请求支出页面
     */
    @RequestMapping(value="addExpendUI",method = RequestMethod.GET)
    public ModelAndView addExpendUI(){
        String viewname = "ExpenditureRecordViews/addExpendUI";
        ModelAndView modelAndView = new ModelAndView(viewname);
        preparationData(modelAndView);
        return modelAndView;
    }

    /**
     *  处理支出请求。
     *  inmoney 收入   exmoney支出
     *  union，根据id得到工会的信息
     *  单位，条目，金额，保障人、备注，新增时间和支出人line58，59
     */
    @RequestMapping(value="addExpend",method = RequestMethod.POST)
    public ModelAndView addExpend(ExpenditureRecord expendRecord, HttpSession httpSession){
        String viewname = "ExpenditureRecordViews/addExpendUI";
        ModelAndView modelAndView = new ModelAndView(viewname);
        expendRecord.setEr_date(new Date());
        expendRecord.setEr_user((User)httpSession.getAttribute("user"));
        Union union = unionService.findById(expendRecord.getEr_union().getUn_id());
        Double inmoney = incomeRecordService.sumMoney(expendRecord.getEr_union().getUn_id());
        Double exmoney = eRecordService.sumExMoney(expendRecord.getEr_union().getUn_id());
        Double balance = inmoney-exmoney;
        if (exmoney == null) exmoney = 0.00;
        try {
            if(balance < 0){
                modelAndView.addObject("message","余额不足，支出失败");
            } else {
                eRecordService.insert(expendRecord);
                SimpleDateFormat sf = new SimpleDateFormat("yyyy年MM月dd日");
                String date = sf.format(new Date());
                modelAndView.addObject("message",union.getUn_name() + date +"支出"+expendRecord.getEr_money()+"元成功,还剩余"+(inmoney-exmoney-expendRecord.getEr_money()));
            }
        }catch (Exception e){
            modelAndView.addObject("message","报账失败");
        }
        preparationData(modelAndView);
        return modelAndView;
    }

    /**
     * 查看支出记录
     * @return
     */
    @RequestMapping(value="getAllExpendRecord/{currentPage}",method = RequestMethod.GET)
    public ModelAndView getAllExpendRecord(@PathVariable("currentPage") Integer currentPage){
        PageBean pageBean = PageBean.getDefault();
        pageBean.setCurrentPage(currentPage);
        pageBean = eRecordService.getAllExpendRecord(pageBean);
        pageBean.calbeginAndEnd();
        String viewname = "ExpenditureRecordViews/getAllExpendRecord";
        ModelAndView modelAndView = new ModelAndView(viewname);
        modelAndView.addObject("pageBean",pageBean);
        Double expendSumMonsy = eRecordService.getAllExpendSumMoney();
        modelAndView.addObject("expendSumMonsy",expendSumMonsy);
        preparationData(modelAndView);
        return modelAndView;
    }

    /**
     * 条件查询支出记录
     * @param currentPage
     * @param date1
     * @param date2
     * @param un_id
     * @param en_id
     * @return
     */
    @RequestMapping(value="getConditionExpendRecord/{currentPage}")
    public ModelAndView getConditionExpendRecord(@PathVariable("currentPage") Integer currentPage,
                                         @RequestParam(value="date1",required = false) String date1,
                                         @RequestParam(value="date2",required = false) String date2,
                                         @RequestParam(value="un_id",required = false) Integer un_id,
                                         @RequestParam(value="en_id",required = false) Integer en_id
                                         ){
        String viewname = "ExpenditureRecordViews/getConditionExpendRecord";
        ModelAndView modelAndView = new ModelAndView(viewname);
        //SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        PageBean pageBean = PageBean.getDefault();
        pageBean.setCurrentPage(currentPage);
        pageBean = eRecordService.getConditionExpendRecord(pageBean,date1,date2,un_id,en_id);
        pageBean.calbeginAndEnd();
        modelAndView.addObject("pageBean",pageBean);
        Double expendSumMonsy = eRecordService.getConditionExpendSumMoney(date1,date2,un_id,en_id);
        modelAndView.addObject("expendSumMonsy",expendSumMonsy);
        preparationData(modelAndView);
        //放入原本起止日期，工会，条目
        modelAndView.addObject("date11",date1);
        modelAndView.addObject("date22",date2);
        modelAndView.addObject("un_id",un_id);
        modelAndView.addObject("en_id",en_id);
        return modelAndView;
    }

    /**
     * 准备数据
     */
    public void preparationData(ModelAndView modelAndView){
        List<Entry> entryList = entryService.getAllExpenEntry();
        List<Union> unionList = unionService.findAll();
        modelAndView.addObject("entryList",entryList);
        modelAndView.addObject("unionList",unionList);
    }
}