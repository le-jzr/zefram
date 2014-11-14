
func Add(target: *var []uint64, source: *[]uint64) {
	#requires(target != nil)
	#requires(source != nil)
	#requires(len(source) <= len(target))

	var sum, next_carry
	var carry = 0
	
	for i in range(source) {
		sum, next_carry = #add64(target[i], source[i])
		
		if carry {
			if sum == #max(uint64) {
				sum = 0
				next_carry = true
			} else {
				sum = #add64(sum, 1)
			}
		}
		
		#static_assert(target[i] + source[i] + int(carry) == sum + int(next_carry)<<64)
		
		target[i] = sum
		carry = next_carry
	}
	
	for i in len(source):len(target) {
		if !carry {
			break
		}
		
		target[i], carry = #add64(target[i], 1)
	}
}
