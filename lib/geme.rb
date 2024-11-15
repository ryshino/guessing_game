
require_relative "../const/questions_const.rb"
include QuestionsConst

question = QUESTIONS.sample
answer = "_" * question.size

life = 5

while life >= 1
  puts "現在のライフ#{life}"
  puts "問題:#{answer}"
  input = gets.chomp
  input = input.downcase
  if input.size > 1
    puts "入力できるのは1文字です。"
    next
  end
  unless ('a'..'z').include?(input)
    puts "入力できるのはアルファベットのみです。"
    next
  end

  target_numbers = []
  question.split('').each_with_index do |question_char, index|
    target_numbers.push(index) if question_char == input
  end

  unless target_numbers.empty?
    target_numbers.each do |num|
      answer[num] = input
    end
    target_numbers.clear
    unless answer.include?("_")
      puts "クリア！"
      break
    end
  else
    life -= 1
  end
end

puts "正解は#{question}でした！"