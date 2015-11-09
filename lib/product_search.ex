defmodule ProductSearch do
	
	def get_product_name_from_user do
		IO.gets("What is the product name?")
		|> String.strip
		|> String.downcase
	end

	def create_list_of_details(product_data) do
		{:ok, product} = product_data
		[product.name, product.price, product.quantity]
	end

	def build_output_message(name, price, quantity) do
		"""
		Name: #{name}
		Price: #{price}
		Quantity on hand: #{quantity}
		"""	
	end	

	def main do
		parsed_file = ParseProducts.get_file |> ParseProducts.parse_products_list
		product_data = get_product_name_from_user |> QueryProducts.find_by_name(parsed_file)
		[name, price, quantity] = create_list_of_details(product_data)
		IO.puts(build_output_message(name, price, quantity))
	end


end
