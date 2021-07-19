# Build a method #bubble_sort that takes an array and returns a sorted array. 
# It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

def bubble_sort(arr)
  iterations = arr.length - 1
  loop do
    i = 0
    loop do 
      if arr[i] > arr[i+1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end
      i += 1
      break if i == iterations
    end
    iterations -= 1
    break if iterations == 0
  end
  arr
end

bubble_sort([4,3,78,2,0,2])