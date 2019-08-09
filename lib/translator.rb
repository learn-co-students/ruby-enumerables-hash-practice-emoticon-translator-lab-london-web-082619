require "yaml"

def load_library(path)
  library = YAML.load_file(path)
  new_lib = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  library.each_pair do | meaning, emojis |
    new_lib["get_meaning"][emojis[1]] = meaning
    new_lib["get_emoticon"][emojis[0]] = emojis[1]
  end
  
  new_lib
end

def get_japanese_emoticon(path, emoticon)
  result = load_library(path)["get_emoticon"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  result = load_library(path)["get_meaning"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end