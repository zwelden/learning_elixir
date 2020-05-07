defmodule User do
  defstruct name: "John", age: 27
end

defmodule Product do
  defstruct [:name]
end

defmodule Car do
  @enforce_keys [:make]
  defstruct [:make, :model]
end
