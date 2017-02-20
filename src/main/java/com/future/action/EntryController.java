package com.future.action;

import com.future.base.BaseController;
import com.future.domain.Entry;
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
@RequestMapping("entry")
public class EntryController extends BaseController{

    /*@RequestMapping("/findByType")
    public ModelAndView findByType(@RequestParam("type")Integer type){
        ModelAndView modelAndView = new ModelAndView();
        List<Entry> entries = entryService.findAll();
        modelAndView.addObject("entries",entries);
        modelAndView.setViewName("/EntryViews/findAll");
        return modelAndView;
    }*/

    @RequestMapping("/delete")
    public ModelAndView delete(@RequestParam("id")Integer id){
        ModelAndView modelAndView = new ModelAndView();
        entryService.deleteById(id);
        List<Entry> entries = entryService.findAll();
        modelAndView.addObject("entries",entries);
        modelAndView.addObject("message","删除成功");
        modelAndView.setViewName("/EntryViews/findAll");
        return  modelAndView;
    }

    @RequestMapping("/update")
    public ModelAndView update(@RequestParam(value="id",required = false)Integer id,Entry entry){
        ModelAndView modelAndView = new ModelAndView();
        if(entry.getEn_id() == null){ //进入更新页面
            Entry en = entryService.findById(id);
            modelAndView.addObject("entry",en);
        }else{
            entryService.update(entry);
            modelAndView.addObject("message","修改成功");
            modelAndView.addObject("entry",entry);
        }
        modelAndView.setViewName("/EntryViews/update");
        return modelAndView;
    }

    @RequestMapping("/findByType")
    public ModelAndView findByType(@RequestParam("type")Integer type){
        ModelAndView modelAndView = new ModelAndView();
        List<Entry> entries = entryService.findByTyep(type);
        modelAndView.addObject("entries",entries);
        modelAndView.addObject("type",type);
        modelAndView.setViewName("/EntryViews/findAll");
        return  modelAndView;
    }

    @ResponseBody
    @RequestMapping("repeat")
    public String repeat(Entry entry){
        String result = "no";
        List<Entry> entries = entryService.findAll();
        for(Entry en:entries)
            if (en.getEn_name().equals(entry.getEn_name()) && en.getEn_type().equals(entry.getEn_type())) result = "yes";
        return  result;

    }

    @ResponseBody
    @RequestMapping("/add")
    public String add(Entry entry){
        System.out.println(entry);
        String result="";
        try {
            entryService.add(entry);
            result = entry.getEn_id()+"";
        }catch (Exception e) {
            result = "添加失败";
        }
        return result;
    }

}
