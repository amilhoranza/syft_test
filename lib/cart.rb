class Cart
  def initialize(costs)
    @costs = costs
  end

  def checkout(items)
    purchases = {}
    items.each do |(item, qty)|
      cost = @costs[item]
      raise ArgumentError, "Item '#{item}' not in @costs array" \
        if cost == nil
      if cost[:bulk] && qty >= cost[:bulk_num]
        tot_cost = qty.to_f * cost[:bulk_price]
        discount = qty.to_f * (cost[:price] - cost[:bulk_price])
      else
        tot_cost = qty.to_f * cost[:price]
        discount = 0.0
      end
      purchases[item] = {qty: qty, tot_cost: tot_cost, discount: discount}
    end
    purchases
  end

  def tot_cost(purchases)
    purchases.values.reduce(0) {|tot, h| tot + h[:tot_cost]}
  end

  def tot_discount(purchases)
    purchases.values.reduce(0) {|tot, h| tot + h[:discount]}
  end
end

costs = {"A"=>{price:    2, bulk: true, bulk_num: 4, bulk_price: 1.75},
         "B"=>{price:   12, bulk: false                              },
         "C"=>{price: 1.25, bulk: true, bulk_num: 6, bulk_price: 1.00},
         "D"=>{price: 0.15, bulk: false                              }}
cart = Cart.new(costs)

purchases = cart.checkout({"A"=>6, "B"=>7, "C"=>4}) # item => quantity purchased
p purchases # => {"A"=>{:qty=>6, :tot_cost=>10.5, :discount=>1.5},
            # =>  "B"=>{:qty=>7, :tot_cost=>84.0, :discount=>0.0},
            # =>  "C"=>{:qty=>4, :tot_cost=>5.0,  :discount=>0.0}}

p cart.tot_cost(purchases)     # => 99.5
p cart.tot_discount(purchases) # =>  1.5
