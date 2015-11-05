defmodule QueryProductsTest do
	use ExUnit.Case
	doctest QueryProducts

	test "queries for a given product from list with 1 product" do
		product = %Product{name: "product", price: 0, quantity: 0}
		list_of_products = [product]
		
		result = QueryProducts.find_by_name("product", list_of_products)
		assert result == {:ok, product} 
	end

	test "queries for a given product from list with 2 products" do
		product1 = %Product{name: "product1", price: 0, quantity: 0}
		product2 = %Product{name: "product2", price: 0, quantity: 0}
		list_of_products = [product1, product2]
		
		result = QueryProducts.find_by_name("product2", list_of_products)
		assert result == {:ok, product2} 
	end


end