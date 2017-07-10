# == Schema Information
#
# Table name: vehicles
#
#  id                     :integer          not null, primary key
#  name                   :string
#  lateral                :string
#  registration_plate     :string
#  latitude               :float
#  longitude              :float
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

class Vehicle < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company, :class_name => "Company", foreign_key: :company_id
  has_many :location
  has_many :assigned_route

  devise :database_authenticatable, :timeoutable

  before_save :assign_default_location

  def assign_default_location
    if !self.latitude? || !self.longitude?
      self.latitude = '5.075555'
      self.longitude = '-75.51883'
    end
  end


  reverse_geocoded_by :latitude, :longitude, :address => :last_location
  after_validation :reverse_geocode, if: -> {self.longitude.present? and self.latitude.present? and self.longitude_changed? or self.latitude_changed?  }   # auto-fetch address
end

