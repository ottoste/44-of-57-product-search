defmodule ParseProductsTest do
	use ExUnit.Case
	doctest ParseProducts

	def build_product(name, price \\ 0, quantity \\ 0) do
  	%Product{name: name, price: price, quantity: quantity}
  end

	test "parses an empty list" do
		file_contents = File.read("test/empty_products_list.json")
		
		result = ParseProducts.parse_products_list(file_contents)
		assert result == []
	end

	test "parses list with one product" do
		product = build_product("Product")
		file_contents = File.read("test/product_list_with_one.json")

		result = ParseProducts.parse_products_list(file_contents)
		assert result == [product]
	end
end