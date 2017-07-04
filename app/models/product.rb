class Product < ApplicationRecord
    belongs_to :sort
    def self.search(search)
        if search
            result = where(["number LIKE ?","%#{search}%"]) if search.present?
            if result.blank?
                result = where(["name LIKE ?","%#{search}%"]) if search.present?
            end
        else
            all
        end
        result
    end
end
