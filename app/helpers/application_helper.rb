module ApplicationHelper
  def nightly_rate_helper
    [
      ["<$75", 7500],
      ["<$100", 10000],
      ["<$125", 12500],
      ["<$150", 15000],
      ["<$200", 20000],
      ["<$300", 30000],
      ["<$500", 50000]
    ]
  end

  def guests_helper
    (0..20).map { |num| [num, num] }
  end

  def categories_helper
    Category.all.map { |category| [category.name, category.id] }
  end
end
