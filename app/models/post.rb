class Post < ApplicationRecord
    def self.import(file)
      csv = CSV.parse(file, :headers => true, encoding: "UTF-8")
        csv.each do |row|
          post_hash = row.to_hash
          post = find_or_create_by!(title: post_hash['title'], description: post_hash['description'], created_at: Time.Now)
          post.update_attributes(post_hash)
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
