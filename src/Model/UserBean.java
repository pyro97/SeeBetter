package Model;
import java.io.Serializable;
import java.sql.Date;
public class UserBean implements Serializable {
	private static final long serialVersionUID = 1L;
	String username;
	String pass;
	String codice;
	String nome;
	String cognome;
	Date data;
	String citta;
	String indirizzo;

	public UserBean() {
		username="";
		pass="";
		codice="";
		nome="";
		cognome="";
		data=new Date(System.currentTimeMillis());
		citta="";
		indirizzo="";
	}

	public UserBean(String string, String string2, String string3, String string4, String string5,Date string6,String string7,String string8) {
		username=string;
		pass=string2;
		codice=string3;
		
		nome=string4;
		cognome=string5;
		data=string6;
		citta=string7;
		indirizzo=string8;
	
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	
}
