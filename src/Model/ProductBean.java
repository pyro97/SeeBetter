package Model;
import java.io.Serializable;
import java.sql.Date;
public class ProductBean implements Serializable {
	private static final long serialVersionUID = 1L;
	String codice;
	String marca;
	String coloreMontatura;
	String genere;
	String tipo;
	double prezzo;
	int sconto;
	int quantita;
	String immagine;
	String immagineC;
	String immagineInfo;
	

	public ProductBean() {
		codice="";
		marca="";
		coloreMontatura="";
		genere="";
		tipo="";
		prezzo=0;
		 sconto=0;
		 quantita=0;
		 immagine="";
		 immagineC="";
		 immagineInfo="";
	
	}

	public ProductBean(String string, String string2, String string3, String string4, String string5, double d, int i,
			int j,String string6,String string7,String string8) {
		codice=string;
		marca=string2;
		coloreMontatura=string3;
		genere=string4;
		tipo=string5;
		prezzo=d;
	
		 sconto=i;
		 quantita=j;
		 immagine=string6;
		 immagineC=string7;
		 immagineInfo=string8;
	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getColoreMontatura() {
		return coloreMontatura;
	}

	public void setColoreMontatura(String coloreMontatura) {
		this.coloreMontatura = coloreMontatura;
	}

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public int getSconto() {
		return sconto;
	}

	public void setSconto(int sconto) {
		this.sconto = sconto;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita += quantita;
	}
	public void setMenoQuantita(int quantita) {
		this.quantita -= quantita;
	}


	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String img) {
		this.immagine = img;
	}
	public String getImmagineC() {
		return immagineC;
	}

	public void setImmagineC(String img) {
		this.immagineC = img;
	}
	public String getImmagineInfo() {
		return immagineInfo;
	}

	public void setImmagineInfo(String img) {
		this.immagineInfo = img;
	}
	@Override
	public String toString() {
		return "ProdottoBean [codice=" + codice + ", marca=" + marca + ", coloreMontatura=" + coloreMontatura
				+ ", genere=" + genere + ", tipo=" + tipo + ", prezzo=" + prezzo + ", sconto=" + sconto + ", quantita="
				+ quantita + "]";
	}

}
