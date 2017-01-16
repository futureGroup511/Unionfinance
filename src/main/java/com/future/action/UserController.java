package com.future.action;

import com.future.base.BaseController;
import com.future.domain.IncomeRecord;
import com.future.utils.Page;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.future.domain.Union;
import com.future.domain.User;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Date;
/**
 */
@Controller
@Scope("prototype")
@RequestMapping("user")
public class UserController extends BaseController{


    //按 时间段 条目 以及分页的组合进行查询 收入情况

    @RequestMapping("inspectIncomeByCondition")
    public ModelAndView inspectIncomeByCondition(HttpServletRequest request){
        //{currentPage}/{entryId}/{startDate}/{endDate}

        Integer currentPage = Integer.parseInt(request.getParameter("currentPage")==null?1+"":request.getParameter("currentPage"));
        currentPage = currentPage<1?1:currentPage;
         String entryIdStr = request.getParameter("entryId");
        Integer entryId = null;
        if(entryIdStr!=null && entryIdStr.trim()!=""){
            entryId = Integer.parseInt(entryIdStr);
        }
        String startDate  = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Page page = null;
        try {
           page = getIncomeRecords(currentPage, startDate, endDate, entryId);
        }catch(ParseException parseException){
            System.out.println("日期格式转换出现异常");
            parseException.printStackTrace();
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(page);

        modelAndView.setViewName("OrdinaryUserJsp/seeIncomeByCodition");
        return modelAndView;
    }


    private Page getIncomeRecords(Integer currentPage, String startDate, String endDate,Integer entryId)throws ParseException{

        List<IncomeRecord> incomeRecordList = null;
        Map<String,Object> paramMap = new HashMap<String,Object>();
        //paramMap.put("currentPage",currentPage==null?1:currentPage<1?1:currentPage);
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        paramMap.put("startDate", startDate==null||"".trim()==endDate?format.format(new Date()):startDate);
        paramMap.put("endDate", endDate==null||"".trim()==endDate?format.format(new Date()):endDate);
        paramMap.put("timeIsOK",1);// 0代表时间不可用 ，1 代表时间可用
        Date beforeDate = format.parse(paramMap.get("startDate").toString());
        Date afterDate = format.parse(paramMap.get("endDate").toString());
        if(beforeDate.equals(afterDate) || beforeDate.after(afterDate)){
            paramMap.put("timeIsOK",0);
        }
        paramMap.put("entryId", entryId);



        int incomeRecordCount = incomeRecordService.queryIncomeRecordsCount(paramMap);
        int pageSize = 8;
        Page page = new Page(currentPage,pageSize,incomeRecordCount,null);
        paramMap.put("page", page);
        incomeRecordList = incomeRecordService.queryIncomeRecords(paramMap);
        page.setRecordlist(incomeRecordList);
        return page;
    }

    @RequestMapping("/findall")
    public ModelAndView findAll(){
        ModelAndView modelAndView = new ModelAndView();
        List<User> users = userService.findAll();
        modelAndView.addObject("users",users);
        modelAndView.setViewName("/UserViews/all");
        return modelAndView;
    }

    @RequestMapping("add")
    public ModelAndView add(User user){
        ModelAndView modelAndView = new ModelAndView();

        if(user.getUser_name() == null){
            List<Union> unions = unionService.findAll(); //得到所有工会
            modelAndView.addObject("unions",unions);
            modelAndView.setViewName("/UserViews/add");
        }else{
            userService.add(user);
            modelAndView.setViewName("redirect:/user/findall");
        }
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("repeat")
    public String repeat(@RequestParam("num")String num){
        List<User> users = userService.findAll();
        for(User user:users)
            if(user.getUser_num().equals(num)) return "yes";
        return "no";
    }

    @RequestMapping("/delete")
    public ModelAndView delete(@RequestParam("id")Integer id){
        ModelAndView modelAndView = new ModelAndView();
        try {
            userService.deleteById(id);
            modelAndView.addObject("message","删除成功");
        }catch (Exception e){
            modelAndView.addObject("message","删除失败");
        }
        modelAndView.setViewName("redirect:/user/findall");
        return modelAndView;
    }

    @RequestMapping("/update")
    public ModelAndView update(@RequestParam(value = "id",required = false)Integer id,User ue){
        ModelAndView modelAndView = new ModelAndView();
        List<Union> unions = unionService.findAll(); //得到所有工会
        modelAndView.addObject("unions",unions);
        if(ue.getUser_id() != null){
           userService.update(ue);
            modelAndView.addObject("user",ue);
            modelAndView.addObject("message","修改成功");
        }else{
            User user = userService.findUserById(id);
            modelAndView.addObject("user",user);
        }
        modelAndView.setViewName("/UserViews/update");
        return  modelAndView;
    }
}
