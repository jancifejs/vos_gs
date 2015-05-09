class Game < ActiveRecord::Base
  has_many :gameservers
  belongs_to :developer
end
