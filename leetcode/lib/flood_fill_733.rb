# recursion (called with extra param, start_color)
# if image[sr][sc] != color && image[sr][sc] == start_color
#   image[sr][sc] = color
# if image[sr - 1][sc] == start_color
#   recurse(image, sr - 1, sc, color, start_color)
# if image[sr + 1][sc] == start_color
#   recurse(...)
# ...
# return image

def recurse(image, sr, sc, color, start_color)
  STDERR.puts("sr: #{sr} | sc: #{sc} | val: #{image[sr][sc]}")
  if image[sr][sc] == start_color && image[sr][sc] != color
    STDERR.puts("fill!")
    image[sr][sc] = color

    if sr + 1 < image.size && image[sr + 1][sc] == start_color
      STDERR.puts("recurse sr + 1")
      recurse(image, sr + 1, sc, color, start_color)
    end
    if sr - 1 >= 0 && image[sr - 1][sc] == start_color
      STDERR.puts("recurse sr - 1")
      recurse(image, sr - 1, sc, color, start_color)
    end
    if sc + 1 < image[sr].size && image[sr][sc + 1] == start_color
      STDERR.puts("recurse sc + 1")
      recurse(image, sr, sc + 1, color, start_color)
    end
    if sc - 1 >= 0 && image[sr][sc - 1] == start_color
      STDERR.puts("recurse sc - 1")
      recurse(image, sr, sc - 1, color, start_color)
    end
  end

  return image
end

def flood_fill(image, sr, sc, color)
  if image[sr][sc] != color
    STDERR.puts("start recurse at #{sr} #{sc}")
    start_color = image[sr][sc]
    image[sr][sc] = color

    if sr + 1 < image.size && image[sr + 1][sc] == start_color
      STDERR.puts("recurse sr + 1")
      recurse(image, sr + 1, sc, color, start_color)
    end
    if sr - 1 >= 0 && image[sr - 1][sc] == start_color
      STDERR.puts("recurse sr - 1")
      recurse(image, sr - 1, sc, color, start_color)
    end
    if sc + 1 < image[sr].size && image[sr][sc + 1] == start_color
      STDERR.puts("recurse sc + 1")
      recurse(image, sr, sc + 1, color, start_color)
    end
    if sc - 1 >= 0 && image[sr][sc - 1] == start_color
      STDERR.puts("recurse sc - 1")
      recurse(image, sr, sc - 1, color, start_color)
    end
  end

  return image
end

puts("--- TEST 1 ---")
image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
sr = 1
sc = 1
color = 2
puts(flood_fill(image, sr, sc, color).inspect)

puts("--- TEST 2 ---")
image = [[0, 0, 0], [0, 0, 0]]
sr = 0
sc = 0
color = 0
puts(flood_fill(image, sr, sc, color).inspect)
