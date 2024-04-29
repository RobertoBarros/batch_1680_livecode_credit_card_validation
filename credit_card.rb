PATTERN = /^(4|5)\d{15}$/

def credit_card_check(credit_card_number)
  credit_card_number = credit_card_number.gsub(/\s/, '')

  if credit_card_number.match?(PATTERN) && verify_luhn?(credit_card_number)
    # PATTERN.match?(credit_card_number)
    "Valid #{credit_card_number[0] == '4' ? 'Visa' : 'Mastercard'} credit card number"
  else
    "Invalid credit card number"
  end
end

def verify_luhn?(credit_card_number)
  # digits = credit_card_number.split('').map {|digit| digit.to_i }
  digits = credit_card_number.split('').map(&:to_i)

  sum = 0
  digits.each_with_index do |digit, index|
    sum += if index.even?
            (digit * 2) % 9
           else
            digit
           end
  end

  sum % 10 == 0

end

# puts verify_luhn?("4137894711755904")
# puts credit_card_check('  4242 42424 242 4242 ')
# puts credit_card_check('  5242 42424 242 4242 ')
