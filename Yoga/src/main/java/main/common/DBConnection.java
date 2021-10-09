package main.common;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
	public static Connection createConnection() {
		try {
			return MysqlDatasource.getInstance().getConnection();
		} catch (SQLException e) {
			throw new IllegalArgumentException(e);
		}
	}
}
