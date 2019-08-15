# require modules here
require "pry"
require "yaml"
def load_library(file)
  emoticonfile = YAML.load_file(file)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticonfile.each do |meaning, emoticon|
    hash["get_meaning"][emoticon[1]] = meaning
    hash["get_emoticon"][emoticon[0]] = emoticon[1] #emoticon1 is japan-emo 
    binding.pry
  end
  return hash
end

def get_japanese_emoticon(file,emoticon)
  hash = load_library(file)
 result = hash["get_emoticon"][emoticon]
 if result
   result
 else
   "Sorry, that emoticon was not found"
 end
end

def get_english_meaning(file,emoticon)
  hash = load_library(file)
 means = hash["get_meaning"][emoticon]
 if means
   means
  else 
    "Sorry, that emoticon was not found"
  end
end