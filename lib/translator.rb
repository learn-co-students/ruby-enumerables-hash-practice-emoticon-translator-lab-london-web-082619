# require modules here
require 'pry'
require "yaml"

def load_library (file)
  emoticons =  YAML.load_file(file)
  new_emos = {:get_meaning => {},
             :get_emoticon => {}
  }
    emoticons.each do |k,v| 
    new_emos[:get_meaning][v[1]] = k
    new_emos[:get_emoticon][v[0]] = v[1]
    
 # binding.pry
  end
  new_emos
end

 def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path) #call load_library
  result = emoticons[:get_emoticon][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
    
  end
end

  
  
  def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons[:get_meaning][emoticon] #the same above 
  #binding.pry
   if result
    result
  else
    "Sorry, that emoticon was not found"
    
  end
end