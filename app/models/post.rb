class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  validate :must_be_clicky

  @@clickbait = [/Won't Believe/i, /Top [0-9]*/i, /Secret/i, /Guess/i]

  def must_be_clicky
    if @@clickbait.none? {|pat| pat.match title}
      errors.add(:title, "must be clickbait")
    end
  end

end
