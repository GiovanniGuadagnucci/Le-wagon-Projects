class GamesController < ApplicationController
  require 'net/http'
  require 'json'

  def new
    @letters = 10.times.map { (65 + rand(25)).chr }
  end

  def score
    @word = params["word"].downcase.chars
    @letters = params["letters"].downcase.split(",")
    url = "https://wagon-dictionary.herokuapp.com/#{params["word"]}"
    response = Net::HTTP.get_response(URI.parse(url))
    result = JSON.parse(response.body)

    @word.each do |letter|
      if @word.all? { |letter| @letters.include? letter }
        @answer = "can be done"
        if result["found"]
          @api = "Congratulations #{params["word"]} is a english word!"
        else
          @api = "Sorry, #{params["word"]} isn't a english word"
        end
      else
        @answer = "Sorry, but #{params["word"]} can't be write."
      end
    end
  end
end
