class Company < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  before_save :parameterize_name, :smart_add_url_protocol
  
  scope :actives, -> { where(:status => 1) }
  scope :recent, -> { order('created_at').limit(10).actives }
  
  def self.like_name(pattern)
    self.where('name like ?', "%#{pattern}%").actives
  end
  
  def last_comment
    last ||= self.comments.last
  end
  
  def to_param
    "#{name}".parameterize
  end
  
  private
  
  def parameterize_name
    self.slug = self.name.parameterize
  end
  def smart_add_url_protocol
    unless self.url.empty?
      self.url = "http://" + self.url unless URI.parse(self.url).scheme
    end
  end
  
end