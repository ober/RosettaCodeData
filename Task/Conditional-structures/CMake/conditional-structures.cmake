set(num 5)

if(num GREATER 100)
  message("${num} is very large!")
elseif(num GREATER 10)
  message("${num} is large.")
else()
  message("${num} is small.")
  message("We might want a bigger number.")
endif()
