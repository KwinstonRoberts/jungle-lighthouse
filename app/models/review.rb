class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  before_create :logged_in?

  validates :description,,

  presence: true
  validates :rating,,

  presence: true

  private
  def logged_in?
    if @current_user.nil?
      return false
    else
      return true
    end
  end
end
