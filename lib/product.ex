defmodule Product do
	@derive [Poison.Encoder]
	defstruct [:name, :price, :quantity]
end