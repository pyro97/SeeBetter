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

public class ProductModelDS implements ProductModel {

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

	private static final String TABLE_NAME = "product";

	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "insert into " + ProductModelDS.TABLE_NAME
				+ " (codice,marca,coloreMontatura,genere,tipo,prezzo,sconto,quantita,immagine,immagineC,immagineInfo) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getCodice());
			preparedStatement.setString(2, product.getMarca());
			preparedStatement.setString(3, product.getColoreMontatura());
			preparedStatement.setString(4, product.getGenere());
			preparedStatement.setString(5, product.getTipo());
			preparedStatement.setDouble(6, product.getPrezzo());
			preparedStatement.setInt(7, product.getSconto());
			preparedStatement.setInt(8, product.getQuantita());
			preparedStatement.setString(9, product.getImmagine());
			preparedStatement.setString(10, product.getImmagineC());
			preparedStatement.setString(11, product.getImmagineInfo());
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
	public synchronized ProductBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "select * from " + ProductModelDS.TABLE_NAME + " where codice = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodice(rs.getString("codice"));
				bean.setMarca(rs.getString("marca"));
				bean.setColoreMontatura(rs.getString("coloreMontatura"));
				bean.setGenere(rs.getString("genere"));
				bean.setTipo(rs.getString("tipo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setSconto(rs.getInt("sconto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setImmagineC(rs.getString("immagineC"));
				bean.setImmagineInfo(rs.getString("immagineInfo"));
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
	public synchronized boolean doDelete(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "delete from " + ProductModelDS.TABLE_NAME + " where codice = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);

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

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME ;

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
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCodice(rs.getString("codice"));
				bean.setMarca(rs.getString("marca"));
				bean.setColoreMontatura(rs.getString("coloreMontatura"));
				bean.setGenere(rs.getString("genere"));
				bean.setTipo(rs.getString("tipo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setSconto(rs.getInt("sconto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setImmagineC(rs.getString("immagineC"));
				bean.setImmagineInfo(rs.getString("immagineInfo"));
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