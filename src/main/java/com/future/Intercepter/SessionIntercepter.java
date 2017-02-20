package com.future.Intercepter;

import com.future.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 牛洧鹏 on 2017/2/18.
 */
public class SessionIntercepter implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String url = request.getRequestURI();
        String beUrl = "loginUI,login";
        if(user == null){
               if(isresource(url)) return true; //判断是不是资源
               else request.getRequestDispatcher("/user/loginUI").forward(request, response);
               return false;
        }
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    private boolean isresource(String url){
        return url.contains("loginUI") || url.contains("js") ||url.contains("jquery") || url.contains("img") || url.contains("css") || url.contains("pdf");
    }
}
