def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
str.split.map { |ele| prc.call(ele) }.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  prc_1.call(num) > prc_2.call(num) ? prc_1.call(num) : prc_2.call(num)
end

def and_selector(arr, prc_1, prc_2)
  arr.select { |ele| prc_1.call(ele) && prc_2.call(ele) } 
end

def alternating_mapper(arr, prc_1, prc_2)
  arr.map.with_index { |ele, i| i.even? ? prc_1.call(ele) : prc_2.call(ele)}
end