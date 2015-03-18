class Base62
	
	@@base_62 = {
		'a' => 0,
		'b' => 1,
		'c' => 2,
		'd' => 3,
		'e' => 4,
		'f' => 5,
		'g' => 6,
		'h' => 7,
		'i' => 8,
		'j' => 9,
		'k' => 10,
		'l' => 11,
		'm' => 12,
		'n' => 13,
		'o' => 14,
		'p' => 15,
		'q' => 16,
		'r' => 17,
		's' => 18,
		't' => 19,
		'u' => 20,
		'v' => 21,
		'w' => 22,
		'x' => 23,
		'y' => 24,
		'z' => 25,
		'A' => 26,
		'B' => 27,
		'C' => 28,
		'D' => 29,
		'E' => 30,
		'F' => 31,
		'G' => 32,
		'H' => 33,
		'I' => 34,
		'J' => 35,
		'K' => 36,
		'L' => 37,
		'M' => 38,
		'N' => 39,
		'O' => 40,
		'P' => 41,
		'Q' => 42,
		'R' => 43,
		'S' => 44,
		'T' => 45,
		'U' => 46,
		'V' => 47,
		'W' => 48,
		'X' => 49,
		'Y' => 50,
		'Z' => 51,
		'0' => 52,
		'1' => 53,
		'2' => 54,
		'3' => 55,
		'4' => 56,
		'5' => 57,
		'6' => 58,
		'7' => 59,
		'8' => 60,
		'9' => 61
	}

	# convert a base 10 number to base 62 number
	def self.to_base62 base_10_num
		result = ''
		return 'aaaaaa' if base_10_num == 0
		while base_10_num > 0
			remainder = base_10_num % 62
			result = @@base_62.key(remainder) + result.to_s
			base_10_num = base_10_num / 62
		end
		result = self.padding result 
	end

	# convert a base 62 number to base 10 number
	def self.to_base10 base_62_num
		result = 0
		base_62_num.each_char do |n|
			result = result * 62 + @@base_62[n]
		end
		return result
	end

	private
	# assume result will be less than or equal to 6 letters
	def self.padding result
		result = 'a' * (6 - result.length) + result
	end

end
