package com.genyuya.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * DAO基类，其它DAO可以直接继承这个DAO，不但可以复用共用的方法，还可以获得泛型的好处。
 */
public class BaseDao<T>{
    private Class<T> entityClass;
    @Autowired
    private SessionFactory sessionFactory;
    /**
     * 通过反射获取子类确定的泛型类
     */
    public BaseDao() {
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        entityClass = (Class) params[0];
    }
    private Session getCurrentSession() {
        Session session=this.sessionFactory.getCurrentSession();
        if(session==null){
            session=this.sessionFactory.openSession();
        }
        return session;
    }
    /**
     * 根据ID加载PO实例
     *
     * @param id
     * @return 返回相应的持久化PO实例
     */
    public T load(Serializable id) {
        return (T) getCurrentSession().load(entityClass, id);
    }

    /**
     * 根据ID获取PO实例
     *
     * @param id
     * @return 返回相应的持久化PO实例
     */
    public T get(Serializable id) {
        return (T) getCurrentSession().get(entityClass, id);
    }

    /**
     * 获取PO的所有对象
     *
     * @return
     */
//    public List<T> loadAll() {
//        return getCurrentSession().load
//    }

    /**
     * 保存PO
     *
     * @param entity
     */
    public void save(T entity) {
      getCurrentSession().save(entity);
    }

    /**
     * 删除PO
     *
     * @param entity
     */
    public void remove(T entity) {
        getCurrentSession().delete(entity);
    }

    /**
     * 更改PO
     *
     * @param entity
     */
    public void update(T entity) {
        getCurrentSession().update(entity);
    }


    public void saveorUpdate(T entity){
        getCurrentSession().saveOrUpdate(entity);
    }

    public void persist(T entity){
        getCurrentSession().persist(entity);
    }

    /**
     * 执行HQL查询
     *
     * @param hql
     * @return 查询结果
     */
    public List find(String hql) {
        return this.getCurrentSession().createQuery(hql).list();
    }

    /**
     * 执行带参的HQL查询
     *
     * @param hql
     * @param params
     * @return 查询结果
     */
    public List find(String hql, Object... params) {

        Query query=this.getCurrentSession().createQuery(hql);
        for(int i=0;i<params.length;i++){
            query.setParameter(i,params[i]);
        }
        return query.list();
    }


    /**
     * 对延迟加载的实体PO执行初始化
     * @param entity
     */
//    public void initialize(Object entity) {
//        this.getHibernateTemplate().initialize(entity);
//    }
//    public HibernateTemplate getHibernateTemplate() {
//        return hibernateTemplate;
//    }
}