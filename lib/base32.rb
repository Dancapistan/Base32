#!/usr/bin/env ruby

# Base32 is a utility class to convert decimal numbers to and from 
# Crockford-style base-32 encoded strings.
#
# Limitations: It only converts decimals to Base-32. It only works 
# for non-negative integers. Floating point and negative numbers
# are on a "maybe some day" todo list.
#
# TODO: Optimize. The algorithms are pretty heavy handed.
class Base32
  
  # Normalized base-32 to decimal encoding values
  ENCODE = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'A' => 10,
    'B' => 11,
    'C' => 12,
    'D' => 13,
    'E' => 14,
    'F' => 15,
    'G' => 16,
    'H' => 17,
    'J' => 18,
    'K' => 19,
    'M' => 20,
    'N' => 21,
    'P' => 22,
    'Q' => 23,
    'R' => 24,
    'S' => 25,
    'T' => 26,
    'V' => 27,
    'W' => 28,
    'X' => 29,
    'Y' => 30,
    'Z' => 31
  }
  
  DECODE=ENCODE.invert
  
  # Converts an input base-32 string into something more normalized.
  def self.normalize(base_32_string)
    return base_32_string.upcase.gsub(/I|L/, '1').gsub('O', '0').gsub(/\s+/, '')
  end
  
  # Converts a base-32 string into a decimal int
  def self.decode(base_32_string)
    base_32_string = Base32.normalize(base_32_string).scan(/./).reverse
    base_10 = 0
    
    place = 1
    base_32_string.each do |base_32_digit|
      base_10 += ENCODE[base_32_digit] * place
      place = place << 5
    end
    
    return base_10
  end
  
  # Converts a decimal int into a base-32 string
  def self.encode(base_10_int)
    base_32_string = ''
    remainder = base_10_int.to_i
    begin
      mod = remainder % 32
      base_32_string += DECODE[mod]
      remainder = (remainder - mod) >> 5
    end while remainder > 0
    
    return base_32_string.reverse
  end
  
end

# (0..1_000_000).each do |b10|
#   b32 = Base32.encode(b10)
#   b10_back = Base32.decode(b32)
#   if b10 != b10_back
#     puts "\t ERROR! #{b10} => #{b32} => #{b10_back}"
#   end
# end