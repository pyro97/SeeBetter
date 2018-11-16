package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrdineModelDS implements OrdineModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/carrello");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "orders";

	@Override
	public synchronized void doSave(OrdineBean bean) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "insert into " + OrdineModelDS.TABLE_NAME
				+ " (username,numero,id,codiceProdotto,quantita,dataOrdine,costoTotale) values (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, bean.getUsername());
			preparedStatement.setInt(2, bean.getNumero());
			preparedStatement.setString(3, bean.getId());
			preparedStatement.setString(4, bean.getCodiceProdotto());
			preparedStatement.setInt(5, bean.getQuantita());
			preparedStatement.setDate(6, bean.getDataOrdine());
			preparedStatement.setDouble(7, bean.getCostoTotale());
			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized OrdineBean doRetrieveByKey(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		OrdineBean bean = new OrdineBean();

		String selectSQL = "select * from " + OrdineModelDS.TABLE_NAME + " where username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setUsername(rs.getString("username"));
				bean.setNumero(rs.getInt("numero"));
				bean.setId(rs.getString("id"));
				bean.setCodiceProdotto(rs.getString("codiceProdotto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setDataOrdine(rs.getDate("dataOrdine"));
				bean.setCostoTotale(rs.getDouble("costoTotale"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	@Override
	public synchronized boolean doDelete(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "delete from " + OrdineModelDS.TABLE_NAME + " where username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, username);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
	
	public synchronized boolean doDeleteAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "delete from " + OrdineModelDS.TABLE_NAME ;

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized List<OrdineBean> doRetrieveAll(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		List<OrdineBean> products = new ArrayList<OrdineBean>();

		String selectSQL = "select * from " + OrdineModelDS.TABLE_NAME + " where username = ?";


		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrdineBean bean = new OrdineBean();
				bean.setUsername(rs.getString("username"));
				bean.setNumero(rs.getInt("numero"));

				bean.setId(rs.getString("id"));
				bean.setCodiceProdotto(rs.getString("codiceProdotto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setDataOrdine(rs.getDate("dataOrdine"));
				bean.setCostoTotale(rs.getDouble("costoTotale"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

}