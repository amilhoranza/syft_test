class BaseRule
  def total_items(items)
    items.map(&:price).reduce(0, :+)
  end
end
