class Product < ActiveRecord::Base
  has_many :line_items
  default_scope :order => "title"
  validates :title, :description, :image_url, :price, :presence => true
  validates :price, :numericality => { :greater_then_or_equal_to => 0.01 }
  validates :title, :uniqueness => true
  validates :image_url, :format => {:with => %r{\.(gif|jpg|png)$}i, :message => "must be a url for gif, jpg or png "}
  before_destroy :ensure_not_referenced_by_any_line_item
  def ensure_not_referenced_by_and_line_item
    if line_items.count.zero?
      return true
    else
      errors[:base] << "line items present"
      return false
    end
  end
end
