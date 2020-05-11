# Write a method, filter_lengths(strings, length), that accepts an array of strings
# and a length as args. The method should return an array containing the strings
# that have at least the given length. The length argument should be optional; if no length
# is passed in, then 5 should be used as the length.

def filter_lengths(array, length = 5)
    new_array = []
    array.each { |word| new_array << word if word.length >= length }
    new_array
    # array.select {|word| word.length >= length }
end

p filter_lengths(["pear", "dragonfruit", "fig", "clementine"], 4)   # ["pear", "dragonfruit", "clementine"]
p filter_lengths(["pear", "dragonfruit", "fig", "clementine"])      # ["dragonfruit", "clementine"]
p filter_lengths(["cat", "dog", "capybara", "mouse"], 7)            # ["capybara"]
p filter_lengths(["cat", "dog", "capybara", "mouse"])               # ["capybara", "mouse"]