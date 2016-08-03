package com.genyuya.dao;
import java.util.*;

import com.alibaba.fastjson.JSON;
import com.genyuya.controller.ApplyInfo;
import com.genyuya.entity.Activity;
import com.genyuya.entity.Usrinfo;
import com.genyuya.util.HttpRequest;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * User对象Dao
 */
@Repository
public class UserDao extends BaseDao<Usrinfo> {
    private final String GET_USER_BY_USERNAME = "from Usrinfo u where u.name = ?";
    private final String QUERY_USER_BY_USERNAME = "from Usrinfo u where u.name like ?";
@Autowired
    private ActivityDao activityDao;
    /**
     * 根据用户名查询User对象
     * @param userName 用户名
     * @return 对应userName的User对象，如果不存在，返回null。
     */
    public Usrinfo getUserByUserName(String userName){
        List<Usrinfo> users = (List<Usrinfo>)find(GET_USER_BY_USERNAME,userName);
        if (users.size() == 0) {
            return null;
        }else{
            return users.get(0);
        }
    }

    public int getMatchUser(String userName,String password){
        String match_user=" from Adminuser s where s.username=? and s.password=?";
        List users=find(match_user,userName,password);
        if(users==null||users.size()==0){
            return 0;
        }else{
            return 1;
        }

    }

    /**
     * 根据用户名为模糊查询条件，查询出所有前缀匹配的User对象
     * @param userName 用户名查询条件
     * @return 用户名前缀匹配的所有User对象
     */
    public List<Usrinfo> queryUserByUserName(String userName){
        return (List<Usrinfo>)find(QUERY_USER_BY_USERNAME,userName+"%");
    }



    public Map<String,String> applyAcitivity(ApplyInfo applyInfo){
        System.out.println("code:"+applyInfo.getCode());
        String url="https://api.weixin.qq.com/sns/oauth2/access_token";
        String param="appid=wx7aae205ef3729ea0&secret=91d29f9a0d6b178f1e2080d2a59579e7&code="+applyInfo.getCode()+"&grant_type=authorization_code";
        String codeResult= HttpRequest.sendGet(url,param);
       System.out.println(codeResult);
//        String openid= JSON.parseObject(codeResult).get("openid").toString();
        String openid=  "323";
        String sql="from Usrinfo u where u.openid=?";
        String sql_activity="from Activity a where a.id=?";
//        List<Activity> lis_acti=find(sql_activity,applyInfo.getActivityId());
        Activity activity=activityDao.get(Integer.parseInt(applyInfo.getActivityId()));
        //activity.setKidNum(Integer.parseInt(applyInfo.getChildNum())+activity.getApplyNum());
        Map<String,String> resultMap=new HashMap<String, String>();
        List<Usrinfo> list=find(sql,openid);
        if(list!=null&&list.size()>0) {
            Usrinfo user = list.get(0);
          if((activity.getApplyNum()+activity.getKidNum())<activity.getMaxNum()){
              Set<Activity> activitySet=user.getActivities();
              System.out.println("activitySet:"+activitySet.size());
              if(activitySet.contains(activity)){
                  resultMap.put("result","fail");
                  resultMap.put("tips","您已报名，不能重复报名！");

              }else{
                    activity.setKidNum(Integer.parseInt(applyInfo.getChildNum())+activity.getKidNum());
                  activity.setApplyNum(activity.getApplyNum()+1);
                  System.out.println("ApplyNum:"+activity.getApplyNum());
                    activitySet.add(activity);
                    user.getActivities().add(activity);
                  System.out.print("user.acisize:"+user.getActivities().size());
                    save(user);
                    activityDao.save(activity);
                    resultMap.put("result","success");
                    resultMap.put("tips","报名成功！");

              }
          }else{
              resultMap.put("result","fail");
              resultMap.put("tips","活动已满，谢谢关注！");

          }
        }else{
            Usrinfo newuser=new Usrinfo();
            newuser.setName(applyInfo.getUsrName());
            newuser.setOpenid(openid);
            newuser.setSex(applyInfo.getUserType());
            newuser.setPhone(applyInfo.getUsrTel());
            Set<Activity> newset=new  HashSet<Activity>();
            activity.setKidNum(Integer.parseInt(applyInfo.getChildNum())+activity.getKidNum());
            activity.setApplyNum(activity.getApplyNum()+1);
            newset.add(activity);
            newuser.getActivities().add(activity);
            persist(newuser);
//            activity.getUsrinfos().add(newuser);
//            activityDao.saveorUpdate(activity);
            resultMap.put("result","success");
            resultMap.put("tips","报名成功！");

        }
        return resultMap;
    }


    public Map<String,String> testPersit(){
        Map<String,String> result=new HashMap<String, String>();
        Usrinfo user=new Usrinfo();
        user.setOpenid("123");
        user.setName("lisong");
        user.setPhone("12344");
        user.setSex("男");
        user.setMedal(3);
        Activity activity=new Activity();
        activity.setApplyNum(33);
        activity.setTime("156");
        activity.setActName("oooo");
        activity.setKidNum(23);
        activity.getUsrinfos().add(user);
        System.out.println("size:"+activity.getUsrinfos().size());
        user.getActivities().add(activity);
        activityDao.save(activity);
//        save(user);
        result.put("result","success");
        result.put("tips","报名成功！");
        return result;
    }

    public List getUserList(){
        String hql="from Usrinfo u order by u.id desc limit 3";
        List<Usrinfo> list=find(hql);
        return list;
    }
}
