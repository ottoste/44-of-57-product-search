defmodule QueryProducts do
	def find_by_name(product_name, list_of_products) do
		product = Enum.find(list_of_products, fn(product) ->
			String.downcase(product.name) == product_name
		end)
		{:ok, product}
	end
end

