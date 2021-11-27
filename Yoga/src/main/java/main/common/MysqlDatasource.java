package main.common;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class MysqlDatasource implements ServletContextListener {
	private static Logger log = LogManager.getLogger("Datasource");
	private static boolean isDev = true;
	private static final String host = isDev ? "localhost" : "dwb-database.csvevuddwdoj.us-east-2.rds.amazonaws.com";
	private static final int port = 3306;
	private static final String user = isDev ? "root" : "root";
	private static final String password = isDev ? "Prasad.89" : "Prasad.89";
	private static final MysqlDatasource instance = new MysqlDatasource();
	private BasicDataSource dataSource;
	
	public static MysqlDatasource getInstance() {
		return instance;
	}
	
	public void start() {
		this.dataSource = new BasicDataSource();
		this.dataSource.setUrl(String.format("jdbc:mysql://%s:%s/%s", host, port, "sakila"));
		this.dataSource.setUsername(user);
		this.dataSource.setPassword(password);
		this.dataSource.setMinIdle(5);
		this.dataSource.setMaxIdle(10);
		this.dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		this.dataSource.setMaxOpenPreparedStatements(100);
		// Stores the date time in UTC
		this.dataSource.setConnectionInitSqls(Collections.singletonList("SET time_zone = '+00:00'"));
		this.dataSource.setTestOnBorrow(true);
		this.dataSource.setTestOnReturn(false);
		this.dataSource.setTestOnCreate(false);
		this.dataSource.setValidationQuery("select 1");
		log.info("DataSource initialized");
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public void stop() throws SQLException {
		this.dataSource.close();
		this.dataSource = null;
		log.info("DataSource has been shutdown");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		instance.start();		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			instance.stop(); 
		} catch (SQLException e) {
			throw new IllegalArgumentException(e);
		}
	}
}
