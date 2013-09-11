class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  
  BASED_OPINION = {:gossips => 1, :interview => 2, :worked_there => 3}
  
  def based_opinion_text
    case self.based_opinion
      when BASED_OPINION[:gossips]
        "Gossips"
      when BASED_OPINION[:interview]
        "In a interview"
      when BASED_OPINION[:worked_there]
        "Worked there"
    end
  end
  
end