require "yaml"

def load_library
  library = YAML.load_file("./lib/emoticons.yml")
  new_lib = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  library.each_pair do | meaning, emojis |
    new_lib["get_meaning"][emojis[1]] = meaning
    new_lib["get_emoticon"][meaning.to_s] = emojis[1]
  end
  
  new_lib
end

load_library