# Ask the user for the key and plaintext
alphabet = ("a".."z").to_a
key = -1
until key.positive?
  print "Key: "
  key = gets.chomp.to_i
end

print "plaintext: "
plaintext = gets.chomp
ciphertext = ""

# Create the ciphertext. You will need to iterate over each character of plaintext.
plaintext.each_char do |char|
 downcase_char = char.downcase
# On each character check if is an alphabetic letter. If you have a list of the alphabetic letters
# you cancheck if the character is included in that list. If not, it goes directly to the ciphertext
if alphabet.include?(downcase_char)
    char_index = alphabet.index(downcase_char)
    new_index = (char_index + key) % 26
    new_char = alphabet[new_index]

    ciphertext += char == downcase_char ? new_char : new_char.upcase
  else
    ciphertext += char
  end
end
# You can also use that alphabetic list to find the letter that is some position after it.
# Do not forget that you should preserve the case of the original letter.
# Finally print the ciphertext to the screen.
puts "ciphertext: #{ciphertext}"