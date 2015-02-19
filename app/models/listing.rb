class Listing < ActiveRecord::Base
  validates :title, :description, :category_id, :max_guests,
            :nightly_rate, :address1, :city, :state, :zip,
            :user_id, presence: true
  validates :shared_bathroom, inclusion: { in: [true, false] }
  validates :title, uniqueness: true
  validates :nightly_rate, numericality: { greater_than: 0 }
  belongs_to :user
  belongs_to :category
  has_many :listing_images
  has_many :reservations
  scope :city, -> (city) { where city: city }
  scope :max_guests, -> (max_guests) { where("max_guests >= ?", max_guests)
    .order(max_guests: :asc) }
  scope :category_id, -> (category_id) { where category_id: category_id }
  scope :nightly_rate, -> (nightly_rate) { where("nightly_rate <= ?", nightly_rate)
    .order(nightly_rate: :asc) }

  # def self.max_guests
  #   where("max_guests >= ?", max_guests)
      # .order(max_guests: :asc)
  # end

  def currency
    nightly_rate / 100
  end

  def full_address
    if !address2.blank?
      "#{address1}, #{address2}, #{city}, #{state} #{zip}"
    else
      "#{address1}, #{city}, #{state} #{zip}"
    end
  end

  def self.filtered_results


  end
end
