require "yaml"
require 'pry'

def load_library(file_path)
  emoticon_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |meaning, both_emoticons|
    english = both_emoticons[0]
    japanese = both_emoticons[1]
    
    
    emoticon_hash["get_meaning"][japanese] = meaning
    emoticon_hash["get_emoticon"][english] = japanese
  end
  emoticon_hash
end

def get_japanese_emoticon (file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].key?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"].key?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end