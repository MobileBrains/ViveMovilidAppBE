# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  phone      :integer
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  manager_id :integer
#

class Company < ApplicationRecord
  has_many :vehicle
  has_many :bus_route
  has_many :assigned_route
  #has_one :managed_by, :class_name => "User", foreign_key: :assigned_by_id
  belongs_to :manager, :class_name => "User", foreign_key: :manager_id
end
