# require modules here
require "yaml"
require "pry"

def load_library (path)
  dictionary = YAML.load_file(path)         #load yaml file from path supplied
  emoticon_dictionary = {"get_emoticon" => {}, "get_meaning" => {}} #create emoticon dictionary with 2 keys
  dictionary.each do |word, emoticons|
    en = emoticons[0]                       #assign english/japanese emoticon to a variabble
    jp = emoticons[1]
    emoticon_dictionary["get_meaning"][jp] = word #use en/jp emoticon as the inner hash key, assign to value needed
    emoticon_dictionary["get_emoticon"][en] = jp
  end
  emoticon_dictionary
end

def get_japanese_emoticon (path, emoticon)
  query = load_library(path)["get_emoticon"][emoticon]
  if query != nil
      query
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (path, emoticon)
  query = load_library(path)["get_meaning"][emoticon]
  if query != nil
      query
  else
    "Sorry, that emoticon was not found"
  end
end
