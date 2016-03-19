def fact(n)
  return 1 if n == 0

  1.upto(n).reduce { |a, e| a * e }
end

def nth_lucas(n)
  a, b = 2, 1

  2.upto(n) do
    a, b = b, a + b
  end

  a
end

def first_lucas(n)
  1.upto(n).map { |index| nth_lucas index }
end

def to_digits(n)
  n.to_s.chars.map { |d| d.to_i }
end

def count_digits(n)
  to_digits(n).length
end

def sum_digits(n)
  to_digits(n).reduce { |a, e| a + e }
end

def factorial_digits(n)
  to_digits(n)
    .map { |d| fact d }
    .reduce { |a, e| a + e }
end

def first_fibs(n)
  a, b = 1, 1
  result = [a]

  2.upto(n) do
    a, b = b, a + b
    result << a
  end

  result
end

def fib_number(n)
  first_fibs(n).join('').to_i
end

def hack?(n)  
  bn = n.to_s 2
  bn.count('1').odd? && bn.reverse == bn
end

def next_hack(n)
  n = n.next
  n = n.next until hack? n
  n
end

def count_vowels(str)
  vowels = 'aeiouy'.chars

  str.downcase
     .chars
     .select { |ch| vowels.include? ch }
     .length
end

def count_consonants(str)
  consonants = 'bcdfghjklmnpqrstvwxz'.chars

  str.downcase
     .chars
     .select { |ch| consonants.include? ch }
     .length
end

def palindrome?(object)
  object.to_s.reverse == object.to_s
end

def p_score(n)
  return 1 if palindrome? n

  1 + p_score(n + n.to_s.reverse.to_i)
end

def largest_palindrome(n)
  n -= 1
  n -= 1 until palindrome? n
  n
end

def prime?(n)
  return false if n <= 1

  ('1' * n) !~ /^1?$|^(11+?)\1+$/ #http://apidock.com/ruby/Prime
end

def first_primes(n)
  primes = []
  i = 0
    while i < n
      if prime?(i)
        primes << i
        i += 1
      else 
        n+=1 
        i +=1
      end
    end

  primes
end

def sieve(n)
  s = (0..n).to_a
  s[0] = s[1] = nil
  s.each do |p|
      next unless p
      break if p * p > n
     (p*p).step(n, p) { |m| s[m] = nil }
    end
  s.compact
end

def char_is_positive_digit?(n)
  # http://batsov.com/articles/2013/07/02/the-elements-of-style-in-ruby-number-5-readability-of-long-numeric-literals/
  123_456_789_0.to_s.chars.include? n
end

def sum_of_numbers_in_string(str)
  result = 0
  chars = str.chars

  while chars.length > 0
    ns = chars.take_while { |ch| char_is_positive_digit? ch }
    result += ns.join('').to_i

    if ns.length == 0
      chars = chars.drop_while { |ch| !char_is_positive_digit? ch }
    else
      chars = chars.drop(ns.length)
    end
  end

  result
end

def anagrams?(a, b)
  a.chars.sort == b.chars.sort
end

def balanced?(n)
  n = n.to_s
  mid = n.length / 2

  left_part = n.slice(0, mid)
  right_part = n.slice(mid + n.length % 2, n.length)

  sum_digits(left_part.to_i) == sum_digits(right_part.to_i)
end

def zero_insert(n)
  result = ''
  index, n = 0, n.to_s

  while index < n.length - 1
    a, b = n[index].to_i, n[index + 1].to_i

    result += a.to_s
    result += '0' if a == b || (a + b) % 10 == 0

    index += 1
  end

  result += n[index]
  result.split(',').join.to_i
end