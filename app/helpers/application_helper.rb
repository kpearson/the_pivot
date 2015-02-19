module ApplicationHelper
  def nightly_rate_helper
    [
      ["Nightly Rate", nil],
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
    (0..20).map { |num| [num, num] }.insert(0, ["Guests", nil])
  end

  def categories_helper
    Category.all.map { |category| [category.name, category.id] }.insert(0, ["Type", nil])
  end
end
