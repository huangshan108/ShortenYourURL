class CantorPair
	# 36 bits in total
	# bit 35 - 34: 0 (avoid overflow)
	# bits 33 - 31: random num 0 - 7 (undecipherable)
	# bits 30 - 16: upper 15 bits of id
	# bits 15 - 0: lower 16 bits of id
	def self.encode id
		if id > (2 ** 31 - 1)
			raise OverflowError
		end
		upper = (rand(8) << 15) + (id >> 16)
		lower = id & (2 ** 16 - 1)
		return ((upper + lower) * (upper + lower + 1)) / 2 + lower
	end

	def self.decode num
		temp = ((-1 + Math.sqrt(1 + 8 * num)) / 2).floor
		upper = temp * (temp + 3) / 2 - num
		lower = num - temp * (temp + 1) / 2
		return ((upper << 16) + lower) & (2 ** 31 - 1)
	end

end