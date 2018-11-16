package Model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCodice().equalsIgnoreCase(product.getCodice())) {
				products.remove(prod);
				break;
			}
		}
 	}
	public void deleteProducts(Collection<ProductBean> collezione) {
		Iterator<?> it = collezione.iterator();
		while(it.hasNext()){
			deleteProduct((ProductBean)it.next());
			
		}
 	}
	
	
	public List<ProductBean> getProducts() {
		return  products;
	}
}
