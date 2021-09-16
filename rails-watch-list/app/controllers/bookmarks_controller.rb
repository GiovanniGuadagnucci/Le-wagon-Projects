require "json"
require "open-uri"

class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
    @pokes = get_poke_list
  end

  def create
    @poke = create_poke
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.valid?
      @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie)
  end

  def get_poke_list
    typeid = params[:list_id]
    uri = URI.open("https://pokeapi.co/api/v2/type/#{typeid}/").read
    data = JSON.parse(uri)
    data["pokemon"].map { |poke| poke["pokemon"]["name"] }
  end

  def create_poke
    pokename = params[:movie]
    uri = URI.open("https://pokeapi.co/api/v2/pokemon/#{pokename}").read
    pokemon_info = JSON.parse(uri)

    uri_description = URI.open("https://pokeapi.co/api/v2/characteristic/#{pokemon_info["id"]}").read
    pokemon_description = JSON.parse(uri_description)
    Movie.create(title: pokemon_info["name"], overview: pokemon_description["descriptions"][2]["description"], poster_url: pokemon_info["sprites"]["front_default"])
  end
end
