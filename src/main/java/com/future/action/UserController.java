package com.future.action;

import com.future.base.BaseController;
import com.future.domain.*;
import com.future.utils.Page;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 */
@Controller
@Scope("prototype")
@RequestMapping("user")
public class UserController extends BaseController{


    /**
     * 请求登陆页面
     * @return
     */
    @RequestMapping(value="loginUI")
    public String loginUI(){
        return "UserViews/loginUI";
    }

    /**
     *
     * @param session
     * @param map
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "login")
    public String login(HttpSession session,Map<String, String> map, @RequestParam("username") String username, @RequestParam("password") String password){
        //根据用户面密码查询用户
        User user = userService.findUserByNameAndPass(username,password);
        if(user != null){
            session.setAttribute("user",user);
            return "UserViews/framset";
        }
        map.put("message","账号或密码错误！");
        return "forward:/user/loginUI";
    }

    @RequestMapping(value="logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/user/loginUI";
    }


    //按 时间段 条目 以及分页的组合进行查询 收入情况
    @RequestMapping("inspectIncomeByCondition")
    public ModelAndView inspectIncomeByCondition(HttpServletRequest request){

        return commonCode(request,0);
    }


    private Page getIncomeRecords(Integer currentPage, String startDate, String endDate,Integer entryId,HttpServletRequest request,Integer queryType)throws ParseException{

        Map<String,Object> paramMap = new HashMap<String,Object>();
        //paramMap.put("currentPage",currentPage==null?1:currentPage<1?1:currentPage);
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        paramMap.put("startDate", startDate==null||"".trim()==endDate?format.format(new Date()):startDate);
        paramMap.put("endDate", endDate==null||"".trim()==endDate?format.format(new Date()):endDate);
        paramMap.put("timeIsOK",1);// 0代表时间不可用 ，1 代表时间可用
        //得到当前人的 公会id 进行查询该工会的记录
        paramMap.put("unionId",((User)request.getSession().getAttribute("user")).getUser_union().getUn_id());
        Date beforeDate = format.parse(paramMap.get("startDate").toString());
        Date afterDate = format.parse(paramMap.get("endDate").toString());
        if(beforeDate.equals(afterDate) || beforeDate.after(afterDate)){
            paramMap.put("timeIsOK",0);
        }
        paramMap.put("entryId", entryId);

        int pageSize = 8;
        Page page = null;
        pageSize = 8;
        if(queryType==0){
            Integer incomeRecordCount = incomeRecordService.queryIncomeRecordsCount(paramMap);
            page = new Page(currentPage,pageSize,incomeRecordCount,null);
            paramMap.put("page", page);
            List<IncomeRecord> incomeRecordList = incomeRecordService.queryIncomeRecords(paramMap);
            page.setRecordlist(incomeRecordList);
        }else if(queryType==1){
            Integer expenseRecordCount = eRecordService.queryExpenseRecordCount(paramMap);
            page = new Page(currentPage,pageSize,expenseRecordCount,null);
            paramMap.put("page", page);
            List<ExpenditureRecord> expenseRecordList = eRecordService.queryExpenseRecord(paramMap);
            page.setRecordlist(expenseRecordList);
        }
        return page;
    }

    // 查询该工会的 支出记录
    @RequestMapping("inspectExpenseByCondition")
    public ModelAndView queryExpenseRecords(HttpServletRequest request){

        return commonCode(request,1);
    }

    // 抽取出 收入和支出相同的代码 进行优化 queryType 0 ：为收入 1 ：支出
    private ModelAndView commonCode(HttpServletRequest request,Integer queryType){

        //{currentPage}/{entryId}/{startDate}/{endDate}
        //对 条件数据 进行处理 用做查询条件进行数据查询
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
            page = getIncomeRecords(currentPage, startDate, endDate, entryId,request,queryType);
        }catch(ParseException parseException){
            System.out.println("日期格式转换出现异常");
            parseException.printStackTrace();
        }
        // 得到所有的 拨款条目项
        List<Entry> entryList = entryService.findByTyep(queryType);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("page", page);
        modelAndView.addObject("entryList", entryList);
        /**
         * 得到该公会的所有的 总拨款 和 总花费
         * modelAndView.addObject("allIncome", ((User)request.getSession().getAttribute("user")).getUser_union().getUn_id(););
         * modelAndView.addObject("allExpense", ((User)request.getSession().getAttribute("user")).getUser_union().getUn_id(););
         */
        //当分页的时候 保存查询条件 进行每次条件的分页数据查询
        modelAndView.addObject("currentPage",currentPage);
        modelAndView.addObject("startDate",startDate);
        modelAndView.addObject("endDate",endDate);
        modelAndView.addObject("entryId",entryId);

        modelAndView.setViewName(queryType==0?"OrdinaryUserJsp/seeIncomeByCodition":"OrdinaryUserJsp/seeExpenseByCodition");
        return modelAndView;
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
