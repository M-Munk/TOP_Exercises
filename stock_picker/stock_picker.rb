# Implement a method that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell.
# Days start at 0.
# Days are equal to the index of the stock price array passed in.

# example:

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12

# rules: buy must occur before sell (cannot buy on the last day, cannot sell on the first day, sell index must be greater than buy index)
# find the greatest difference between a & b when a[index] < b[index]



def stock_picker(prices)
  current_max = 0
  buy_index = 0
  sell_index = 1
  (0...prices.length - 1).each do |buy|
    (buy + 1...prices.length).each  do |sell|
      if prices[sell] - prices[buy] > current_max
        current_max = prices[sell] - prices[buy]
        buy_index = buy
        sell_index = sell
      end
    end
  end
  [buy_index, sell_index]
end

stock_picker([1, 2, 4])
stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([99, 76, 23, 43, 1])