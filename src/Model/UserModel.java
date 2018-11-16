package Model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public interface UserModel {
	public void doSave(UserBean utente) throws SQLException;

	public boolean doDelete(String username) throws SQLException;
	
	public boolean doDeleteAll() throws SQLException;

	public UserBean doRetrieveByKey(String username) throws SQLException;
	
	public Collection<UserBean> doRetrieveAll(String order) throws SQLException;
}
