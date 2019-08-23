require "yaml"

def load_library(emoticons_path)
  emoticon_list = YAML.load_file(emoticons_path)
  
  emoticons = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  
  #meaning = english name/key 
  #emoticon[0] = eng_emoticon, 
  #emoticon[1] = jap_emoticon
  
  emoticon_list.each do |meaning, emoticon|
    emoticons[:get_meaning][emoticon[1]] = meaning
    emoticons[:get_emoticon][emoticon[0]] = emoticon[1]
  end
  emoticons
end

def get_japanese_emoticon(emoticons_path, emoticon)
  load_library(emoticons_path)[:get_emoticon].each_pair do |key, value|
    if key == emoticon
      return value 
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticons_path, emoticon)
  load_library(emoticons_path)[:get_meaning].each_pair do |key, value|
    if key == emoticon
      return value 
    end
  end
  "Sorry, that emoticon was not found" 
end