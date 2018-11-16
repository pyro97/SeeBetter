package Model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public interface OrdineModel {
	public void doSave(OrdineBean orders) throws SQLException;

	public boolean doDelete(String code) throws SQLException;
	
	public boolean doDeleteAll() throws SQLException;

	public OrdineBean doRetrieveByKey(String username) throws SQLException;
	
	public List<OrdineBean> doRetrieveAll(String orders) throws SQLException;
}
