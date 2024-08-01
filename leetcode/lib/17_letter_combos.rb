require 'active_support'
require 'algorithms'

VALID_DIGITS = ["2", "3", "4", "5", "6", "7", "8", "9"]
NUMBER_LETTER_MAP = {
  :"0" => "",
  :"1" => "",
  :"2" => ["a", "b", "c"],
  :"3" => ["d", "e", "f"],
  :"4" => ["g", "h", "i"],
  :"5" => ["j", "k", "l"],
  :"6" => ["m", "n", "o"],
  :"7" => ["p", "q", "r", "s"],
  :"8" => ["t", "u", "v"],
  :"9" => ["w", "x", "y", "z"]
}
NUMBER_LETTER_ARR = [0, 1, "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

def valid_digits?(digits)
  digits_arr = digits.split("")
  digits_arr.any? { |digit| VALID_DIGITS.include?(digit) }
end

def letter_combos_slow(digits)
  letters = []  # 2D array of letters to operate on
  ans = []      # answer array

  if digits.nil? || digits.empty?
    return []
  end

  digits_arr = digits.split("")
  # if digits includes non-valid number, return []
  unless valid_digits?(digits)
    return []
  end

  # BRUTE FORCE: O(n + n*m)
  # for each digit in digits:
  #   get the letters from the map, and add to array
  for digit in digits_arr do
    STDERR.puts("digit: #{digit}")
    letters.push(NUMBER_LETTER_MAP[digit.to_sym])
  end

  # for each mapping in letters:
  #   for each next_mapping in letters:
  #     create combo of letter + next_letter, and add to ans array
  STDERR.puts("letters: #{letters.inspect}")
  # for mapping in letters do
    # TODO: finish the combo of letters
  # end

  # return ans
  return ans
end

def letter_combos_iterative(digits)
  if digits.nil? || digits.empty?
    return []
  end

  digits_arr = digits.split("")
  # if digits includes non-valid number, return []
  unless valid_digits?(digits)
    return []
  end

  combos = []
  queue = Containers::Queue.new
  queue.push("")

  while !queue.empty?
    STDERR.puts("queue: #{queue.size}")
    str = queue.pop
    STDERR.puts("str: #{str}")

    if str.size == digits.size
      STDERR.puts("str size matches digits size")
      combos.push(str)
      STDERR.puts("combos: #{combos}")
    else
      next_digit = digits_arr[str.size].to_sym
      STDERR.puts("next_digit: #{next_digit}")
      letters = NUMBER_LETTER_MAP[next_digit]
      STDERR.puts("letters: #{letters.inspect}")

      for letter in letters do
        STDERR.puts("letter: #{letter}")
        queue.push(str + letter)
      end
      STDERR.puts("queue at end: #{queue.size}")
    end
  end

  return combos
end

def backtrack(combo, next_digits, output)
  # STDERR.puts("start of backtrack!")
  # STDERR.puts("combo: #{combo} | next_digits: #{next_digits} | output: #{output.inspect}")
  if next_digits.empty?
    # STDERR.puts("next_digits empty, adding combo to output...")
    output.push(combo)
    # STDERR.puts("output after: #{output.inspect}")
  else
    # STDERR.puts("else block...")
    letters = NUMBER_LETTER_MAP[next_digits[0].to_sym]
    # STDERR.puts("letters: #{letters}")
    letters.each do |letter|
      # STDERR.puts("letter: #{letter}")
      backtrack(combo + letter, next_digits[1..], output)
    end
  end
end

def letter_combos(digits)
  return [] if digits.empty?

  return [] unless valid_digits?(digits)

  output = []

  backtrack("", digits, output)
  output
end

puts("--- TEST 1 ---")
digits_1 = "23"
puts(letter_combos(digits_1).inspect)
# return ["ad","ae","af","bd","be","bf","cd","ce","cf"]

puts("--- TEST 2 ---")
digits_2 = ""
puts(letter_combos(digits_2).inspect)
# return []

puts("--- TEST 3 ---")
digits_3 = "2"
puts(letter_combos(digits_3).inspect)
# return ["a","b","c"]

puts("--- TEST 4 ---")
digits_4 = "1"
puts(letter_combos(digits_4).inspect)
# return nothing or error?

puts("--- TEST 5 ---")
digits_5 = "67"
puts(letter_combos(digits_5).inspect)
# return ["mp","mq","mr","ms","np",...,"op",...]

puts("--- TEST 6 ---")
digits_6 = "456"
puts(letter_combos(digits_6).inspect)
# return ...
