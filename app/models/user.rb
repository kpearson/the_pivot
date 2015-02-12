class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :email,
            format: {
              with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
            }, uniqueness: true
  has_many :orders
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def admin?
    false
  end
end
