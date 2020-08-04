class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    validate :clickbait

    def clickbait
        if self.title.present?
            unless self.title.match?(/Won't Believe | Secret | Top\s(0...9) | Guess/)
                self.errors[:title] << "Title doesn't match"
            end
        end 
    end
end
