class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :display_name, :about_me, presence: true
  validates :display_name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :display_name, :slug, uniqueness: true
  validates :email,
            format: {
              with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
            }, uniqueness: true
  has_many :orders
  has_attached_file :image, styles: { medium: "300x300>",
                                      thumb: "100x100>" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  before_save :generate_slug

  def generate_slug
    self.slug = display_name.parameterize
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    false
  end
end
