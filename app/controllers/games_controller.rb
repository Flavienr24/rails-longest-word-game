# require 'json'
# require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      letter = ('a'..'z').to_a.sample
      @letters << letter.upcase
    end

  end

  def score
    @user_word = params[:user_word]
    url = "https://wagon-dictionary.herokuapp.com/#{@user_word}"
    results = open(url).read
    @word = JSON.parse(results)
    @found = @word['found']
    @length = @word['length']
  end
end

