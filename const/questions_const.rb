module QuestionsConst
  def self.questions
    %w[
      apple
      strawberry
      cherry
      persimmon
      pumpkin
      carrot
      watermelon
      pear
      tomato
      eggplant
    ].map(&:freeze).freeze
  end
end