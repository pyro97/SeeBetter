package Model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public interface ProductModel {
	public void doSave(ProductBean product) throws SQLException;

	public boolean doDelete(String code) throws SQLException;
	
	public boolean doDeleteAll() throws SQLException;

	public ProductBean doRetrieveByKey(String code) throws SQLException;
	
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException;
}
