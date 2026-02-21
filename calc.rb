def get_number(message)
  loop do
    print message
    input = gets.chomp
    exit if input == "q"

    #数字チェック
    if input =~ /\A-?\d+(\.\d+)?\z/ #数字の正規表現(/\A-?\d+(\.\d+)?\z/）
      return input.to_f #qでなければ数字に変換
    else
      puts "エラー：有効な数字を入力してください。"
    end
  end
end

loop do
  puts "電卓アプリです！(qで終了)"

  #入力数値1
  num1 = get_number("\n1つ目の数字を入力：")

  #入力演算子
  operator = nil
  loop do
    print "演算子を入力してください (+, -, *, /)："
    operator = gets.chomp
    exit if operator == "q"

    if ["+", "-", "*", "/"].include?(operator)
      break
    else
      puts "有効な演算子を入力してください。"
    end
  end

  #入力数値2
  num2 = get_number("2つ目の数字を入力：")

  # 【修正】演算子によって計算内容を変える（条件分岐）
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
