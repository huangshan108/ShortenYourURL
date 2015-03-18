class CantorPair
	def self.encode id, rand_int
		return ((id + rand_int) * (id + rand_int + 1)) / 2 + rand_int
	end

	def self.decode num
		temp = ((-1 + Math.sqrt(1 + 8 * num)) / 2).floor
		id = temp * (temp + 3) / 2 - num
		return id
	end
end