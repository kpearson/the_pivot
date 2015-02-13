class Listing < ActiveRecord::Base
  validates :title, :description, :category_id, :max_guests,
            :nightly_rate, :address1, :city, :state, :zip,
            :user_id, presence: true
  validates :shared_bathroom, :inclusion => {:in => [true, false]}
  validates :title, uniqueness: true
  validates_numericality_of :nightly_rate, greater_than: 0
  belongs_to :user
  belongs_to :category
  has_many :photos
  has_many :reservations

  def currency
    nightly_rate / 100
  end

  def full_address
    if address2
    "#{address1}, #{address2}, #{city}, #{state} #{zip}"
    else
    "#{address1}, #{city}, #{state} #{zip}"
    end
  end
end
