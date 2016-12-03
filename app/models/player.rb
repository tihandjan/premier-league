class Player < ActiveRecord::Base
  belongs_to :team

  def to_param
    "#{name}".parameterize
  end
   
end
