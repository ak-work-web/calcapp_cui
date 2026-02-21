class Calculator
  def get_number(message)
    loop do
      print message
      input = gets.chomp
      return :quit if input == "q"

      #数字チェック
      if input =~ /\A-?\d+(\.\d+)?\z/ #数字の正規表現(/\A-?\d+(\.\d+)?\z/）
        return input.to_f #qでなければ数字に変換
      else
        puts "エラー：有効な数字を入力してください。"
      end
    end
  end

  #メインループ
  def run
    puts "電卓アプリです！(qで終了)"
    loop do
      #入力数値1
      num1 = get_number("\n1つ目の数字を入力：")
      break if num1 == :quit # ':quit'ならメインループ抜ける

      #入力演算子
      operator = nil
      loop do
        print "演算子を入力してください (+, -, *, /)："
        operator = gets.chomp
        break if operator == "q"

        if ["+", "-", "*", "/"].include?(operator)
          break
        else
          puts "有効な演算子を入力してください。"
        end
      end
      break if operator == "q"

      #入力数値2
      num2 = get_number("2つ目の数字を入力：")
      break if num2 == :quit # ':quit'ならメインループ抜ける

      if operator == "+"
        result = num1 + num2
      elsif operator == "-"
        result = num1 - num2
      elsif operator == "*"
        result = num1 * num2
      elsif operator == "/"
        if num2 == 0
          puts "0で割ることはできません。"
          next #ループ最初に戻る
        end
        result = num1 / num2
      else
        puts "エラー：不正な演算子です。"
        next
      end

      puts "計算結果は #{result} です。"
    end

    puts "電卓アプリを終了します。ご利用ありがとうございました！"
  end
end

calc = Calculator.new
calc.run
