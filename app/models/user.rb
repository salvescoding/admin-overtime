class User < ApplicationRecord
  has_many :posts
  validates_presence_of :first_name, :last_name, :phone

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  REGEX_PHONE = /\A[0-9]*\Z/

  validates_format_of :phone, with: REGEX_PHONE

  validates :phone, length: { is: 9 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
