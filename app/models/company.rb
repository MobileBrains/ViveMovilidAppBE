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
#

class Company < ApplicationRecord
  has_many :vehicle
  has_many :bus_route
  has_many :assigned_route
end
