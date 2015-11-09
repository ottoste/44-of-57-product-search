defmodule ParseProducts do

	def get_file do
		File.read("products.json")
	end

	def parse_products_list(json_file) do
		{:ok, raw_list} = json_file
		{:ok, %{"products" => products}} = Poison.decode(raw_list, as: %{"products" => [Product]})
		products
	end
	
end