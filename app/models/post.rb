class Post < ApplicationRecord
    def self.import(file)
      csv = CSV.parse(file, :headers => true)
        csv.each do |row|
            Post.create!(row.to_hash) 
        end
    end
    

    def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end

end
