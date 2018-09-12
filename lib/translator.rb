# require modules here
require 'yaml'

def load_library(path)
  # code goes here
  library ={"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |meaning, arr|
    english, japanese = arr
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(path, emote)
  # code goes here
  lib = load_library(path)
  res = lib["get_emoticon"][emote]
  if res
    res
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emote)
  # code goes here
  lib = load_library(path)
  res = lib["get_meaning"][emote]
  if res
    res
  else
    "Sorry, that emoticon was not found"
  end
end