defmodule QueryProductsTest do
	use ExUnit.Case
	doctest QueryProducts

 	def build_product(name, price \\ 0, quantity \\ 0) do
  	%Product{name: name, price: price, quantity: quantity}
  end

	test "queries for a given product from list with 1 product" do
		product = build_product("product")
		list_of_products = [product]
		
		result = QueryProducts.find_by_name("product", list_of_products)
		assert result == {:ok, product} 
	end

	test "queries for a given product from list with 2 products" do
		product1 = build_product("product1")
		product2 = build_product("product2")
		list_of_products = [product1, product2]
		
		result = QueryProducts.find_by_name("product2", list_of_products)
		assert result == {:ok, product2} 
	end
end