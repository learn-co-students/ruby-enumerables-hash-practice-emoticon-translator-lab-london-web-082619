require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_emote_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons.each do |emote_name,corresponding_emote_array|
    new_emote_hash["get_meaning"][corresponding_emote_array[1]] = emote_name
    new_emote_hash["get_emoticon"][corresponding_emote_array[0]] = emoticons[emote_name][1]
  end
  new_emote_hash
end
#here you you iterating over everything in the emoticons .yml file, having assigned the keys to be called 'emote_name' and the values of those keys to be called 'corresponding_emote_array'. You're then adding what is found at index 1 (the japanese emotes) of those arrays to be the keys of the nested hash you earlier created, 'get_meaning' and assigning the values of these newly created keys to be the name of the emotes, i.e. emote_name, which is a string.
#next you are doing a similar thing with the nested hash 'get_emoticon' which takes the english emote at index 0 of the 'corresponding_emote_array's to be the keys of this new hash and then assings the values of these new keys to be whatever is found at index 1 of the return value of 'emote_name', which is always the japanese emote. 

def get_japanese_emoticon(file_path, emoticon)
  if !converted_emoticon = load_library(file_path)["get_emoticon"][emoticon]
    return "Sorry, that emoticon was not found"
  end
  converted_emoticon
end

def get_english_meaning(file_path, emoticon)
  if !english_meaning = load_library(file_path)["get_meaning"][emoticon]
    return "Sorry, that emoticon was not found"
  end 
  english_meaning
end


#For these two final methods you are asking it to assess the previously defined two nested hashes (get_meaning and get_emoticon) to return the value for the key that is passed to it in the argument call (emoticon). If a false value is returned i.e. it can't find the key to return a value for, it apologises. 