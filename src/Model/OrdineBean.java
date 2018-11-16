package Model;
import java.io.Serializable;
import java.sql.Date;
public class OrdineBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	String username;
	int numero;
	String id;
	String codiceProdotto;
	int quantita;
	Date dataOrdine;
	double costoTotale;
	

	public OrdineBean() {
		
		username="";

		id="";
		numero=0;
		codiceProdotto="";
		quantita=0;
		dataOrdine=new Date(System.currentTimeMillis());
		costoTotale=0;
		
	
	}

	public OrdineBean(String n,int x,String string, String string2, int string3,Date data,Double costo) {
		
		username=n;
		numero=x;
		id=string;
		codiceProdotto=string2;
		quantita=string3;
		dataOrdine=data;
		costoTotale=costo;
	}

	public Date getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(Date dataOrdine) {
		this.dataOrdine = dataOrdine;
	}

	public double getCostoTotale() {
		return costoTotale;
	}

	public void setCostoTotale(double costoTotale) {
		this.costoTotale = costoTotale;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCodiceProdotto() {
		return codiceProdotto;
	}

	public void setCodiceProdotto(String codiceProdotto) {
		this.codiceProdotto = codiceProdotto;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
}
