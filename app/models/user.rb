class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_departments
  has_many :departments, through: :users_departments
  has_many :positions, through: :users_departments
  accepts_nested_attributes_for :users_departments
  has_many :users_factories
  has_many :factories, through: :users_factories
  accepts_nested_attributes_for :users_factories
  has_many :orders
  has_many :order_notes
  has_many :order_technique_details
  has_many :payments
  has_many :payment_notes
end
