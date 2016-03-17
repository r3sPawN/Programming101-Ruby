def number_to_digits(n)
  n.to_s.chars.map(&:to_i)
end

def digits_to_number(digits)
  digits.reduce(0) { |a, e| a * 10 + e }
end

def max_scalar_product(v1, v2)
  v1 = v1.sort
  v2 = v2.sort

  v1.each_with_index
    .map { |x, i| x * v2[i] }
    .reduce(&:+)
end

def sum_matrix(m)
  m.map { |row| row.reduce(&:+) }.reduce(&:+)
end

def grayscale_histogram(image)
  histogram = Array.new 256, 0

  row_index, col_index = 0, 0

  while row_index < image.length
    col_index = 0

    while col_index < image[row_index].length
      pixel_value = image[row_index][col_index]
      histogram[pixel_value] += 1
      col_index += 1
    end

    row_index += 1
  end

  histogram
end

def max_span(numbers)
  result = []
  while numbers.size != 0
    current_numb = numbers[0]
    span = 1
    numbers = numbers.drop(1)

    numbers.each_with_index do |d, i|
      span += 1 if numbers.drop(i).include(current)
    end
  end
  result << span
end

def matrix_bombing_plan(m)
  result = {}
  m.each_with_index do |x, xi|
    x.each_with_index do |y, yi|
      result.store([xi, yi], y)
    end
  end

  result.each_pair do |key, value|
    m1 = Marshal.load(Marshal.dump(m))
    p m1
    sum = sum_matrix(change_matrix(m1, key, value))
    puts sum
    result[key] = sum
  end

  result
end

def change_matrix(m, start_pos, bomb)
  directions = [[0, 1], [0, -1], [1, 0], [-1, 0],
                [1, 1], [-1, 1], [1, -1], [-1, -1]]
  directions.each do |dir|
    cur_i, cur_j = start_pos[0], start_pos[1]
    cur_i += dir[0]
    cur_j += dir[1]
    if (cur_i >= 0 && cur_i < m.size) && (cur_j >= 0 && cur_j < m[0].size)
      m[cur_i][cur_j] -= bomb
      m[cur_i][cur_j] = 0 if m[cur_i][cur_j] < 0
    end
  end

  m
end

def group(elements)
  array = []
  result = []
  elements.each do |i|
    if array.include?(i)
      array << i
    else
      result << array unless array.empty?
      array = [i]
    end
  end
  result << array unless array.empty?

  result
end

def max_consecutive(items)
  items = group(items)
  max = 0
  items.each do |i|
    max = i.size if max < i.size
  end

  max
end



