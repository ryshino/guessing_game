require_relative '../const/questions_const.rb'
require_relative '../module/input_validator.rb'

class HangmanGame
  include InputValidator

  def initialize
    @question = QuestionsConst.questions.sample
    @answer = "_" * @question.size
    @life = 5
  end

  def play
    while @life > 0
      display_status
      input = get_input

      next unless valid_input?(input)
      
      process_guess(input)

      if solved?
        display_clear_message
        break
      end
    end
    display_answer
  end

  private
    def display_status
      puts "ライフ#{@life}"
      puts "問題'#{@answer}'"      
    end

    def display_clear_message
      puts "クリア！"
    end

    def display_answer
      puts "正解は#{@question}でした！"
    end

    def get_input
      gets.chomp.downcase
    end

    def valid_input?(input)
      single_character?(input) && validate_alphabet?(input)
    end

    def process_guess(input)
      target_positions = find_matching_positions(input)
      
      if target_positions.empty?
        @life -= 1
      else
        update_answer(target_positions, input)
      end
    end

    def find_matching_positions(input)
      target_positions = []
      @question.chars.each_with_index do |char, index|
        target_positions.push(index) if char == input
      end
      target_positions
    end

    def update_answer(positions, input)
      positions.each do |pos|
        @answer[pos] = input
      end
    end

    def solved?
      !@answer.include?("_")
    end
end