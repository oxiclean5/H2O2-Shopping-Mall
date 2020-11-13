package model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Item {
	@NotEmpty(message="상품번호를 입력하세요.")
	private String code;
	@NotEmpty(message="상품이름을 입력하세요.")
	private String name;
	@NotNull(message="상품가격을 입력하세요.")
	@Range(min=0,max=1000000,message="{min}과 {max}사이를 입력하세요.")
	private Integer price;
	private String info;
	private String origin;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
}
