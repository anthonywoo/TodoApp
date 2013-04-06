class Item < ActiveRecord::Base
  belongs_to :project
  attr_accessible :completed, :description, :title, :project_id
  validates :title, :description ,:presence=> true

  def self.search(query)
    query.delete "title" if query["title"] == ""
    query["completed"] = query["completed"] == "false" ? false : true if query["completed"]
    
    @results = Item
    if query.include?(:title)
      @results = @results.where("title LIKE '%#{query[:title]}%'")
    end
    if query.include?(:completed)
      @results = @results.where("completed =?", query[:completed])
    end
    @results = @results.all
    # @movies = Movie
    # if query.include?(:name)
    #   @movies = @movies.where(:name => query[:name])
    # end
    # if query.include?(:completed)
    #   @movies = @movies.where(:complted => true)
    # end

    # @movies = @movies.all
  end
end
