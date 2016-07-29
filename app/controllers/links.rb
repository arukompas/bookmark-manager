class Bookmark_manager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    #tag = Tag.first_or_create(name: params[:tags])
    #link.tags << tag
  end
    link.save
    redirect to('/links')
  end
end