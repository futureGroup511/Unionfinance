package com.future.action;

import com.future.base.BaseController;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by 牛洧鹏 on 2017/1/15.
 */
@Controller
@Scope("prototype")
@RequestMapping("expenditurerecord")
public class ExpenditureRecordController extends BaseController {

    @RequestMapping(value="addExpendUI",method = RequestMethod.GET)
    public void addExpendUI(){
        System.out.println("我到了");
    }
}
