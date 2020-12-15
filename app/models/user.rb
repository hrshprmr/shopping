class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, inverse_of: :user
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank

def admin?
     has_role?(:admin)
end

def client?
      has_role?(:client)
end

end
