a =[ [31,10],
     [314,100],
     [3142,1000],
     [31428,10000],
     [314285,100000],
     [3142857,1000000],
     [31428571,10000000],
     [314285714,100000000]
   ]
a.each do |n1,n2|
  print "%-9s / %-9s : " % [n1, n2]
  r2cf(n1,n2) {|n| print "#{n} "}
  puts
end
