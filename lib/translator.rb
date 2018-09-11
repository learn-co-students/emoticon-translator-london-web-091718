require "yaml"
emos = YAML.load_file('lib/emoticons.yml')
# require modules here
puts emos

def load_library(path)
  emo = YAML.load_file(path)
  hashey = Hash.new(0)
  hashey['get_meaning']=Hash.new(0)
  hashey['get_emoticon']=Hash.new(0)
  emo.each do |meaning,usajap|
    jap = usajap[1]
    usa = usajap[0]
    hashey['get_meaning'][jap]=meaning
    hashey['get_emoticon'][usa]=jap
  end
return hashey
end



def get_japanese_emoticon(path,usaemoticon)
  emo = load_library(path)
  
  emo['get_emoticon'].each do |usa,jap|
    if usaemoticon == usa
      return jap
    end
  end
    return "Sorry, that emoticon was not found"
end


def get_english_meaning(path,japemoticon)
  emo = load_library(path)

  emo['get_meaning'].each do |jap,meaning|
    if japemoticon == jap
      return meaning
    end
  end
    return "Sorry, that emoticon was not found"
end
