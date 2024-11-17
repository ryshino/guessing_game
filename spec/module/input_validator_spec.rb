require_relative '../../module/input_validator'

RSpec.describe InputValidator do
  describe '.single_character?' do
    context '正常系' do
      it '1文字の場合はtrueを返すこと' do
        expect(InputValidator.single_character?('a')).to be true
      end
    end

    context '異常系' do
      it '複数文字の場合はfalseを返すこと' do
        expect(InputValidator.single_character?('ab')).to be false
      end

      it '空文字の場合はfalseを返すこと' do
        expect(InputValidator.single_character?('')).to be false
      end

      it 'エラーメッセージを出力すること' do
        expect { InputValidator.single_character?('ab') }.to output("入力できるのは1文字です。\n").to_stdout
      end
    end
  end

  describe '.validate_alphabet?' do
    context '正常系' do
      it 'アルファベット小文字の場合はtrueを返すこと' do
        expect(InputValidator.validate_alphabet?('a')).to be true
      end

      it 'すべての小文字アルファベットでtrueを返すこと' do
        ('a'..'z').each do |char|
          expect(InputValidator.validate_alphabet?(char)).to be true
        end
      end
    end

    context '異常系' do
      it '数字の場合はfalseを返すこと' do
        expect(InputValidator.validate_alphabet?('1')).to be false
      end

      it '特殊文字の場合はfalseを返すこと' do
        expect(InputValidator.validate_alphabet?('!')).to be false
      end

      it '大文字の場合はfalseを返すこと' do
        expect(InputValidator.validate_alphabet?('A')).to be false
      end

      it 'エラーメッセージを出力すること' do
        expect { InputValidator.validate_alphabet?('1') }.to output("入力できるのはアルファベットのみです。\n").to_stdout
      end
    end
  end
end