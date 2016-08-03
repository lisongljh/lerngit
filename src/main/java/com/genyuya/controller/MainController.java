package com.genyuya.controller;

import com.alibaba.fastjson.JSON;
import com.genyuya.dao.UserDao;
import com.genyuya.entity.Usrinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Mr.Song on 2016/5/1.
 */
@Controller
@RequestMapping("/user")
public class MainController {
    @Autowired
    private UserDao userDao;

    @RequestMapping("/hello")
    public String hello(){

        return "hello";
    }
@RequestMapping("/getuser/{username}")
    public String findUser(ModelMap modelMap, @PathVariable String username){
        Usrinfo user=userDao.getUserByUserName(username);
        modelMap.addAttribute("user",user);
        return "user";

    }


    @RequestMapping("/showuser")
    @ResponseBody
    public Object showAll(){
        List<Usrinfo> listUser=userDao.find("from Usrinfo");
        return listUser;
    }

    @RequestMapping("/applyActivity")
    @ResponseBody
    public Object applyActivity(ApplyInfo applyInfo){
//        Map<String,String> result=userDao.applyAcitivity(applyInfo);
        Map<String,String> result=userDao.testPersit();
        return JSON.toJSON(result);
    }
}
