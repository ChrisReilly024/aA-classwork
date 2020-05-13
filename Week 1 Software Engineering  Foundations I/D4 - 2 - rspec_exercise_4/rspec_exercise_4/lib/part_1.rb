def my_reject(array, &prc)
    array.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    arr.select { |ele| prc.call(ele) }.length == 1
end

def hash_select(hash, &prc)
    new_hash = Hash.new(0)
    hash.each { |k,v| new_hash[k] += v if prc.call(k,v) }
    new_hash
end

def xor_select(arr, prc1, prc2)
    arr.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (prc2.call(ele) && !prc1.call(ele)) }
end

def proc_count(val, array)
    array.count { |proc| proc.call(val) }
end

