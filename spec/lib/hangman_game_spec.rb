require_relative '../../lib/hangman_game'
require_relative '../../const/questions_const.rb'

RSpec.describe HangmanGame do
  let(:game) { described_class.new }

  before do
    # ランダム性を排除するためselect_questionが呼ばれたら'ruby'を返す
    allow(HangmanGame).to receive(:select_question).and_return('ruby')
  end

  describe '#initialize' do
    it '正常に、初期値が設定されていること' do
      expect(game.instance_variable_get(:@life)).to eq(5)
      expect(game.instance_variable_get(:@answer)).to eq('____')
      expect(game.instance_variable_get(:@question)).to eq('ruby')
    end
  end

  describe '#play' do
    context "ゲームを開始したとき" do
      before do
        # game.get_inputが呼ばれたら、'r'、'u'、'b'、'y'を順番一個ずつに返す
        allow(game).to receive(:get_input).and_return('r', 'u', 'b', 'y')
      end

      it "ライフと問題が表示され、最後に正解が表示されること" do
        expected_output = [
          "ライフ5",
          "問題'____'",
          "ライフ5",
          "問題'r___'",
          "ライフ5",
          "問題'ru__'",
          "ライフ5",
          "問題'rub_'",
          "クリア！",
          "正解はrubyでした！"
        ].join("\n") + "\n"

        expect { game.play }.to output(expected_output).to_stdout
      end
    end

    context '一度も間違えずに問題をクリアしたとき' do
      before do
        allow(game).to receive(:get_input).and_return('r', 'u', 'b', 'y')
        # コンソールの出力をしないようにする
        allow(game).to receive(:puts)
      end

      it 'ライフが減っていないこと' do
        expect { game.play }.not_to change { game.instance_variable_get(:@life) }
      end

      it 'answerが正解の文字に置き換わっていること' do
        game.play
        expect(game.instance_variable_get(:@answer)).to eq 'ruby'
      end
    end

    context "途中で間違えて正解したとき" do
      before do
        allow(game).to receive(:get_input).and_return('x', 'x', 'r', 'u', 'b', 'y')
        allow(game).to receive(:puts)        
      end

      it "間違えた数ライフが減っていること" do
        expect { game.play }.to change { game.instance_variable_get(:@life) }.by(-2)
      end

      it 'answerが正解の文字に置き換わっていること' do
        game.play
        expect(game.instance_variable_get(:@answer)).to eq 'ruby'
      end
    end
    

    context '問題をクリア出来なかったとき' do
      before do
        allow(game).to receive(:get_input).and_return('f', 'a', 'i', 'l')
        allow(game).to receive(:puts)
      end

      it 'ライフが0になっていること' do
        game.play
        expect(game.instance_variable_get(:@life)).to eq 0
      end
    end
  end

  describe '#valid_input?' do
    context 'アルファベット1文字の場合' do
      it '有効な入力として判定されること' do
        expect(game.send(:valid_input?, 'a')).to be true
      end
    end

    context '複数文字の場合' do
      it '無効な入力として判定されること' do
        expect(game.send(:valid_input?, 'ab')).to be false
      end
    end

    context '数字の場合' do
      it '無効な入力として判定されること' do
        expect(game.send(:valid_input?, '1')).to be false
      end
    end
  end

  describe '#process_guess' do
    context '正解の文字の場合' do
      it '@answerが正解の文字に置き換わること' do
        game.send(:process_guess, 'r')
        expect(game.instance_variable_get(:@answer)[0]).to eq('r')
      end
    end

    context '不正解の文字の場合' do
      it 'ライフが一つ減ること' do
        expect { game.send(:process_guess, 'x') }.to change { game.instance_variable_get(:@life) }.by(-1)
      end
    end
  end

  describe '#solved?' do
    context '全ての文字が正解の文字に変わった場合' do
      it 'trueを返すこと' do
        game.instance_variable_set(:@answer, 'ruby') # @answerの値を'ruby'にする
        expect(game.send(:solved?)).to be_truthy
      end
    end

    context '正解していない文字がある場合' do
      it 'falseを返すこと' do
        game.instance_variable_set(:@answer, 'r_b_') # @answerの値を'r_b_'にする
        expect(game.send(:solved?)).to be_falsey
      end
    end
  end
end