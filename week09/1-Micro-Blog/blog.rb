require 'sinatra'

class Post
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

ALLPOSTS = [Post.new(1, 'post'), Post.new(2, 'post2')]

get '/' do
  posts = ALLPOSTS
  posts.map(&:name).join(', ')
end

get "/:id" do
  posts = ALLPOSTS
  @req_post = posts.select { |post| post.id == params['id'].to_i } [0]
  erb :post_id
end

# get '/new' do

# end
# not finished
