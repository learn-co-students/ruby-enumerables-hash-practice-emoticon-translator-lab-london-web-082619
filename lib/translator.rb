# require modules here

require "yaml"

def load_library (file)
  emoticonfile = YAML.load_file(file)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticonfile.each do |meaning, emoticon|
      hash["get_meaning"][emoticon[1]]= meaning
      hash["get_emoticon"][emoticon[0]] = emoticon[1]
    end
  return hash
end

def get_japanese_emoticon (file, emoticon)
 emoticonfile = load_library(file)
   if emoticonfile["get_emoticon"].include? (emoticon)
     return emoticonfile["get_emoticon"][emoticon]
   else
     return "Sorry, that emoticon was not found"
   end
end



def get_english_meaning(file, emoticon)
  emoticonfile = load_library(file)
  if emoticonfile["get_meaning"].include?(emoticon)
    return emoticonfile["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
