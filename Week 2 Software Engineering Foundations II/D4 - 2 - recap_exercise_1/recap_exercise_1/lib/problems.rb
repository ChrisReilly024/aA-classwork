# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    new_arr = []
    vowels = "aeiou" #["a", "e", "i"...]
    pairs = words.combination(2).to_a.map {|pair| pair.join(" ")}
    pairs.each do |two_word| # "action europe"
        new_arr << two_word if vowels.split("").all? {|vowel| two_word.include?(vowel)}

    end
    new_arr
end
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false

# require 'prime'
def composite?(num)
    (2...num).each do |i|
       return true if num % i == 0
    end
    false
    # !Prime.prime?(num)
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    # str.split("").combination(2).to_a.map(&:join).select {|pair| bigrams.include?(pair)}.uniq
    #{|pair| bigrams.include?(pair)}
    # arr = []
    # for i in 0...str.length do 
    #     for j in 0...str.length do 
    #         arr << str[i] + str[j] if j > i
    #     end
    # end
    # new_arr = arr.select {|pair| bigrams.include?(pair)}.uniq

    # new_arr.map.with_index do |ele1, i1|
    #     bigrams.each do |ele|
    bigrams.select {|bigram| str.include?(bigram)}
end
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = {} 
        prc ||= Proc.new {|k,v| k == v}
        self.each do |k,v|
            new_hash[k] = v if prc.call(k,v)
        end  
        
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    # def substrings(length = nil)
    #     arr = []
    #     (0...self.length).each do |i|
    #         (0...self.length).each do |j|
    #             arr.push(self[i..j]) if self[i..j] == length 
    #         end
    #     end
            
    #     # length.nil? ? arr : arr.select {|ele| ele.length == length}
    #     arr
    # end

    
    def substrings(length = nil)
        sub = []
        (0...self.length).each do |i|
            (0..self.length).each do |idx|
                sub << self[i..idx] if idx >= i
            end
        end
        length.nil? ? sub.uniq : sub.select {|ele| ele.length == length && length != nil}.uniq
    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        # alpha = ("a".."z").to_a
        # hash = Hash[alpha.zip(alpha.rotate(num))] #___.zip = overlays the two arrays, _.rotate rotates however many times
        # self.gsub(/\w/,hash)

        alpha = ("a".."z").to_a
        new_str = ""
        self.each_char do |char|
            idx = alpha.index(char)
            new_idx = idx + num
            new_char = alpha[new_idx % alpha.length]
            new_str += new_char
        end
        new_str
    end
end
