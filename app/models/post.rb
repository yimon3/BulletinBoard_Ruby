class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness:true
  
    def self.import(file)
      csv = CSV.parse(file, :headers => true)
       csv.each do |row|
        Moulding.create!(row.to_hash)
      end
    end

    def self.to_excel(options={})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |post|
          csv  << post.attributes.values_at(*column_names)
        end
      end
    end

    
end
