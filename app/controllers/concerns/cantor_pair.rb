class CantorPair
	# 36 bits in total
	# bit 35: 0 (avoid overflow)
	# bits 34 - 32: rand(7) (undecipherable)
	# bits 31 - 16: upper 16 bits of id
	# bits 15 - 0: lower 16 bits of id
	def self.encode id
		upper = (rand(7) << 16) + (id >> 16)
		lower = id & (2 ** 16 - 1)
		return ((upper + lower) * (upper + lower + 1)) / 2 + lower
	end

	def self.decode num
		temp = ((-1 + Math.sqrt(1 + 8 * num)) / 2).floor
		upper = temp * (temp + 3) / 2 - num
		lower = num - temp * (temp + 1) / 2
		return ((upper << 16) + lower) & (2 ** 32 - 1)
	end

end