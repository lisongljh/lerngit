package com.genyuya.dao;

import com.genyuya.controller.CreateActivity;
import com.genyuya.entity.Activity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Mr.Song on 2016/5/16.
 */
@Repository
public class ActivityDao extends BaseDao<Activity> {

    public void saveActivity(CreateActivity createActivity){
       Activity activity=new Activity();
        activity.setActName(createActivity.getActivityname());
        activity.setPlace(createActivity.getActivityplace());
        activity.setTime(createActivity.getActivitime());
        activity.setAbstractContent(createActivity.getActivityprofile());
        save(activity);
    }

    public List getActivityList(){
        String hql="from Activity a order by a.id desc limit 3";
        List<Activity> list=find(hql);
        return list;
    }
}
