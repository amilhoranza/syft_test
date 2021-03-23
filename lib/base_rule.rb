# BaseRule class
class BaseRule
  def calculate_discount(items)
    raise NotImplementedError, 'Should be implemented in concrete class!'
  end

  def total_items(items)
    items.map(&:price).reduce(0, :+)
  end
end
