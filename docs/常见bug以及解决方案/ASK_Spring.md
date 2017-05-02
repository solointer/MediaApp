### 利用STS搭建Spring Boot项目之后,无法导入注解

  + 报错： @Autowire注解的类返回为null

        解决方案：通过添加注解指定扫描注解的package
        @ComponentScan("com.controller, com.service, com.dao, com.model")

### Spring Boot - Handle to Hibernate SessionFactory

  + 在主类里面加入

        @Bean
        public SessionFactory sessionFactory(HibernateEntityManagerFactory hemf){
            return hemf.getSessionFactory();
        }

        修改application.properties配置，添加如下代码

        spring.jpa.properties.hibernate.current_session_context_class=org.springframework.orm.hibernate4.SpringSessionContext

### 执行hql语句?占位符传递参数报错

  + 报错： Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based


        报错的行数主要是setparanter,推测@entity注解没又被正确解析

          find(getCurrentSession(),"from com.model.User s where s.account=? and s.password=?", account, password);

          private Query createQuery(Session session,String queryString,Object...params){
          Query query = session.createQuery(queryString);
          for(int i=0;i<params.length;i++){
            query.setParameter(i, params[i]);
          }
          return query;
          }

        解决方案：

            @EnableJpaRepositories("com.dao") // JPA扫描该包路径下的Repositorie
            @EntityScan("com.model") // 扫描实体类

### 使用spa连接数据库每次删除相关的表报错table doesn't exist

      spring.jpa.properties.hibernate.hbm2ddl.auto=update            
