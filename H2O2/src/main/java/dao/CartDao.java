package dao;

import java.util.List;

import model.CartItem;

public interface CartDao {
	void insertCart(CartItem item);
	void deleteCart(CartItem item);
	void updateCart(CartItem item);
	Integer getMaxCartId();
	List<CartItem> selectCart(String id);
}









