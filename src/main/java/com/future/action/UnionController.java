package com.future.action;

import com.future.base.BaseController;
import com.future.domain.Union;
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
@Scope
@RequestMapping("union")
public class UnionController extends BaseController{

    @RequestMapping("/add")
    public ModelAndView add(Union union){

        ModelAndView modelAndView = new ModelAndView();
        if(union.getUn_name() != null) {
            try {
                unionService.add(union);
                modelAndView.addObject("message","添加成功");
            }catch (Exception e){
                modelAndView.addObject("message","添加失败");
            }

        }else modelAndView.addObject("message","请正确填写工会信息，不可重复");
        modelAndView.setViewName("/UnionViews/add");
        return  modelAndView;
    }

    @ResponseBody
    @RequestMapping("repeat")
    public String repeat(@RequestParam("name")String name){
        String result="no";
        List<Union> unions = unionService.findAll();

        for (Union union:unions)
            if(union.getUn_name().equals(name)) result ="yes";
        return result;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(@RequestParam(value = "id",required = false)Integer id){
        ModelAndView modelAndView = new ModelAndView();
        if(id != null){
            try {
                unionService.deleteById(id);
                modelAndView.addObject("message","删除成功");
            }catch (Exception e){
                modelAndView.addObject("message","删除失败");
            }
        }
        List<Union> unions = unionService.findAll();
        modelAndView.addObject("unions",unions);
        modelAndView.setViewName("/UnionViews/delete");
        return modelAndView;
    }

    @RequestMapping("/update")
    public ModelAndView update(@RequestParam(value = "id",required = false)Integer id,Union un){
        ModelAndView modelAndView = new ModelAndView();
        if(un.getUn_id() == null){
            Union union = unionService.findById(id);
            modelAndView.addObject("union",union);
        }else{
            unionService.update(un);
            modelAndView.addObject("union",un);
            modelAndView.addObject("message","修改成功");
        }
        modelAndView.setViewName("/UnionViews/update");
        return  modelAndView;
    }

}
