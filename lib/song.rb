require 'pry'

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    x = self.new
    x.save
    x
  end

  def self.new_by_name(name)
    x = self.new
    x.name = name
    x
  end

  def self.create_by_name(name)
    x = self.new_by_name(name)
    x.save
    x
  end

  def self.find_by_name(name)
    self.all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(string)
    x = self.new
    artist_song = string.split(" - ")
    artist_song[1].slice!(".mp3")
    x.name = artist_song[1]
    x.artist_name = artist_song[0]
    x
  end

  def self.create_from_filename(string)
    x = self.new_from_filename(string)
    x.save
    x
  end

  def self.destroy_all
    self.all.clear
  end
end

