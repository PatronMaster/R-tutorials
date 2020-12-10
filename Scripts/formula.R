library(Ryacas)

# Calculate equations based in one formula
poly1<-ysym("((a + b + c + d)*((e - f + g - h + i - j+ k - l - m - n - o - p)+ (q - r + s - t - x - u)+ (v - w + y - z) ))/((aa + bb + cc + dd)*((e + g + i + k - ee - ff- gg - hh - m - n - o - p)    + (q + s - ii - jj - x - u)    + (v + y) ))==0")

# We want find the x
solve(poly1, "x")
