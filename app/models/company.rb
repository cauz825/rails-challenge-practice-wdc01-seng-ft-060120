class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees

    accepts_nested_attributes_for :offices

    validates :name, presence: true, length: {minimum: 6}, uniqueness: {case_sensitivity: false}
    
end
