class Post < ActiveRecord::Base
  attr_accessible :published, :released, :title, :category_ids

  HasTokens.on self
  has_tokens public: 10
  
  validates :published, presence: true
  validates :released, presence: true
  validates :title, presence: true
  
  has_many :post_category_memberships, dependent: :destroy
  has_many :categories, through: :post_category_memberships
  
  #has_and_belongs_to_many :categories, class_name: "PostCategoryMembership"
  
  before_validation :generate_tokens, on: :create
  
  def self.by_token(token)
    where(public_token: token).limit(1).first
  end
  
  def to_param
    public_token
  end
end