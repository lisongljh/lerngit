package com.genyuya.dao;

import com.genyuya.entity.Question;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Mr.Song on 2016/6/18.
 */
@Repository
public class QuetionDao extends BaseDao<Question> {

    public List getQuestionList(){
        String hql="from Question q order by q.id desc limit 3";
        List<Question> list=find(hql);
        return list;
    }
}
