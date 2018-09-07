require "yaml"
require 'pry'

def load_library(hash)
  emoticon_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons = YAML.load_file('lib/emoticons.yml')
  emoticons.each do |meaning, both_emoticons|
    emoticon_hash["get_meaning"] = meaning
    emoticon_hash["get_emoticon"] = both_emoticons[1]
  end
  emoticon_hash
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end