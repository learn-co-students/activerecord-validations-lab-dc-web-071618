class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title, :is_clickbaity

  def is_clickbaity
    clickbaits = ["Won't Believe", "Secret", "Top", "Guess"]
    if title
      check = clickbaits.map do |clickbait|
        title.include?(clickbait)
      end
    end
    if check && check.exclude?(true)
      errors.add(:title, "not clickbait-y")
    end
  end

end
