class Transaction < ApplicationRecord
  belongs_to :broker
  belongs_to :buyer
end
