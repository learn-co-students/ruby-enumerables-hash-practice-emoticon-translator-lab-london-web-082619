# require modules here
require "yaml"
def load_library(path)
  emoticons = YAML.load_file(path)
  hash = {
  "get_meaning" => {},
  "get_emoticon" => {}
  }
  emoticons.each{|meaning, emoji|
  hash["get_meaning"][emoji[1]] = meaning
  hash["get_emoticon"][emoji[0]] = emoji[1]
  }
  return hash
end

def get_japanese_emoticon(path, emoticon_input)
  emoticons = load_library(path)
 if emoticons["get_emoticon"].include?(emoticon_input)
  emoticons["get_emoticon"][emoticon_input]
else 
 return  "Sorry, that emoticon was not found"
end 

end

def get_english_meaning(path, emoticon_input)
  library = load_library(path)
  if library["get_meaning"].include?(emoticon_input)
    library["get_meaning"][emoticon_input]
  else 
    return "Sorry, that emoticon was not found"
  end 

end