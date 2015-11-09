defmodule ProductSearchTest do
  use ExUnit.Case
  doctest ProductSearch  

  test "build list containing product details" do
  	query_result = {:ok, %Product{name: "ipad", price: 500.00, quantity: 72}}
  	assert ProductSearch.create_list_of_details(query_result) == ["ipad", 500.00, 72]
  end

	test "build output message" do
		[name, price, quantity] = ["ipad", 500.00, 72]

		result = ProductSearch.build_output_message(name, price, quantity)
		assert result == "Name: ipad\nPrice: 500.0\nQuantity on hand: 72\n"
	end
end
