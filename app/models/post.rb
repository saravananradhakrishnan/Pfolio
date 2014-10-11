class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :published, lambda { where(is_published: true) }

  validates :title, presence: true,
            length: {minimum: 5}

  validates_presence_of :body
end
