defprotocol Utility do
  @fallback_to_any true
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end

defimpl Utility, for: Any do
  def type(_value), do: "unmatched type"
end
