package com.future.action;

import com.future.base.BaseController;
import com.future.domain.Union;
import com.future.domain.User;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by 牛洧鹏 on 2017/1/15.
 */
@Controller
@Scope("prototype")
@RequestMapping("user")
public class UserController extends BaseController{

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
