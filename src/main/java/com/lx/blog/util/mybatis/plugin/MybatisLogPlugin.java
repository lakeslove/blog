package com.lx.blog.util.mybatis.plugin;

import java.sql.Connection;
import java.util.Properties;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Intercepts({@Signature(
		type = StatementHandler.class,
		method = "prepare", 
		args = {Connection.class,Integer.class}
)})
public class MybatisLogPlugin implements Interceptor{
	
	private static Logger log = LoggerFactory.getLogger(MybatisLogPlugin.class);
	private String prefix;
	private final String DEFAULT_PREFIX = "SQL语句 : ";
	
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		StatementHandler stmtHandler = (StatementHandler)invocation.getTarget();
		MetaObject metaStmtHandler = SystemMetaObject.forObject(stmtHandler);
		while(metaStmtHandler.hasGetter("h")){
			Object object = metaStmtHandler.getValue("h");
			metaStmtHandler = SystemMetaObject.forObject(object);
		}
		while(metaStmtHandler.hasGetter("target")){
			Object object = metaStmtHandler.getValue("target");
			metaStmtHandler = SystemMetaObject.forObject(object);
		}
		String sql = (String)metaStmtHandler.getValue("delegate.boundSql.sql");
		log.info(prefix+" "+sql);
		//TODO 只获取了参数类型，要看参数值可以在此打断点
		Object parameters = metaStmtHandler.getValue("delegate.boundSql.parameterObject");
		log.info("参数类型为 ： "+parameters.getClass());
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		//使用默认的mybatis提供的类生成代理对象
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		this.prefix = (String)properties.getProperty("prefix",DEFAULT_PREFIX);
	}
	

}
