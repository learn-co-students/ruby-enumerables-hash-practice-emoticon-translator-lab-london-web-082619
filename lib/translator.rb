# require modules here
require "yaml"
require "pry"
def load_library (yaml)
  #binding.pry
  result = {:get_meaning => {}, :get_emoticon => {}}
  file = YAML.load_file(yaml)
  file.each do |meanings, emoticons|
  #binding.pry
    result[:get_meaning][emoticons[1]] = meanings
    result[:get_emoticon][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon (yaml, emoticon)
  #binding.pry
    if  load_library(yaml)[:get_emoticon][emoticon]
      return load_library(yaml)[:get_emoticon][emoticon]
    else
      return "Sorry, that emoticon was not found"
   end
end

def get_english_meaning (yaml, emoticon)
    #binding.pry
  if  load_library(yaml)[:get_meaning][emoticon]
      return load_library(yaml)[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
    end
end