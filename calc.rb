loop do
  puts "電卓アプリです！(qで終了)"

  #入力数値1
  num1 = nil
  loop do
    print "1つ目の数字を入力："
    input1 = gets.chomp #これでqを受け取る想定
    exit if input1 == "q"

    #数字チェック
    if input1 =~ /\A-?\d+(\.\d+)?\z/ #数字の正規表現(/\A-?\d+(\.\d+)?\z/）
      num1 = input1.to_f #qでなければ数字に変換
      break
    else
      puts "有効な数字を入力してください。"
    end
  end

  #入力演算子
  operator = nil
  loop do
    print "演算子を入力してください (+, -, *, /)："
    operator = gets.chomp
    exit if operator == "q"

    # if operator == "+" || operator == "-" || operator == "*" || operator == "/"
    if ["+", "-", "*", "/"].include?(operator)
      break
    else
      puts "有効な演算子を入力してください。"
    end
  end

  #入力数値2
  num2 = nil
  loop do
    print "2つ目の数字を入力："
    input2 = gets.chomp
    exit if input2 == "q"

    if input2 =~ /\A-?\d+(\.\d+)?\z/ #数字の正規表現(/\A-?\d+(\.\d+)?\z/）
      num2 = input2.to_f
      break
    else
      puts "有効な数字を入力してください。"
    end
  end

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
