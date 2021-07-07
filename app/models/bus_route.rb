# == Schema Information
#
# Table name: bus_routes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#

class BusRoute < ApplicationRecord
  belongs_to :company
  has_many :assigned_route
end
