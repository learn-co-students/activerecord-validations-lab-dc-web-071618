class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :must_be_clickbait

    def must_be_clickbait
        clickbait = /Won't Believe|Secret|Top \d|Guess/
        if title =~ clickbait 
            true 
        else
            errors.add(:title, "must be clickbait")
            false
        end
    end
end
