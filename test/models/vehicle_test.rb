# == Schema Information
#
# Table name: vehicles
#
#  id                     :integer          not null, primary key
#  name                   :string
#  lateral                :string
#  registration_plate     :string
#  latitude               :float            default(5.0730109)
#  longitude              :float            default(-75.5314799)
#  last_location          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
