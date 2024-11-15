module InputValidator
  module_function

  def single_character?(input)
    return true if input.size == 1
    puts "入力できるのは1文字です。"
    false
  end

  def validate_alphabet?(input)
    return true if ('a'..'z').include?(input)
    puts "入力できるのはアルファベットのみです。"
    false
  end
end