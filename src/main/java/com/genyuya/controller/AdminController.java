package com.genyuya.controller;

import com.genyuya.dao.ActivityDao;
import com.genyuya.dao.QuetionDao;
import com.genyuya.dao.UserDao;
import com.genyuya.entity.Activity;
import com.genyuya.entity.Question;
import com.genyuya.entity.Usrinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Mr.Song on 2016/5/2.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserDao userDao;
    @Autowired
    private ActivityDao activityDao;
    @Autowired
    private QuetionDao quetionDao;


    @RequestMapping("/login")
    public String login(){
        return "webLongin";
    }

    @RequestMapping("/loginCheck")
    public String loginCheck(LoginUser loginUser, Model model){
        int result=userDao.getMatchUser(loginUser.userName,loginUser.password);

        if(result<=0){
            model.addAttribute("error","用户名或密码错误");
           return "webLongin";
        }else{
            model.addAttribute("user",loginUser.getUserName());
            return "webIndex";
        }
    }


    @RequestMapping("/createActivity")
    public String createActivity(CreateActivity createActivity,Model model){
        activityDao.saveActivity(createActivity);
        return "redirect:/admin/webActivit.html";

    }
    @RequestMapping("/{index}")
    public String getIndexWeb(@PathVariable String index){
        return index;
    }
    @RequestMapping("/getActivity")
    @ResponseBody
    public Object getActivity(){
        List<Activity> list=activityDao.getActivityList();
        return list;
    }
    @RequestMapping("/getUserList")
    @ResponseBody
    public Object getUserList(){
        List<Usrinfo> user=userDao.getUserList();
        return user;
    }
    @RequestMapping("/getQuestionList")
    @ResponseBody
    public Object getQuestionList(){
        List<Question> questions=quetionDao.getQuestionList();
        return questions;
    }
}
