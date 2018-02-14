
module ConvertToBinary

  protected

  def pad_binary(number)
    line = number.to_s(2)
    prefix = "0" * (16-line.length)
    "#{prefix}#{line}"
  end
end