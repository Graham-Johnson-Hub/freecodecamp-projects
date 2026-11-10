def range_of_numbers(start_num, end_num):
    # Base case: when start_num equals end_num
    if start_num == end_num:
        return [start_num]
    
    # Recursive case: call the function moving toward the base case and append the result
    return [start_num] + range_of_numbers(start_num + 1, end_num)