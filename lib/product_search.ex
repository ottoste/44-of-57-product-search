defmodule ProductSearch do
	
	def main do
		product = get_product_data 
		cond do 
			product == nil 	-> error_message
			true 						-> product_message(product) 
		end
	end

	def get_product_name_from_user do
		IO.gets("What is the product name?")
		|> String.strip
		|> String.downcase
	end

	def get_product_data do
		search = get_product_name_from_user
		{:ok, product} = ParseProducts.parsed_file |> QueryProducts.find_by_name(search)
		product
	end

	def error_message do
		IO.puts("Product not found, please try again.")
		main
	end

	def product_message(product) do
		[name, price, quantity] = create_list_of_details(product)
		IO.puts(
		"""
		Name: #{name}
		Price: #{price}
		Quantity on hand: #{quantity}
		""")	
	end

	def create_list_of_details(product) do
		[product.name, product.price, product.quantity]
	end



end
