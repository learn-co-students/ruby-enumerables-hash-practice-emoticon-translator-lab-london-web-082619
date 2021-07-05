require "yaml"

def load_library(filename)
  newHash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons = YAML.load(File.read(filename))

  emoticons.each do |meaning, emoji|

    newHash['get_meaning'][emoji[1]] = meaning
    newHash['get_emoticon'][emoji[0]] = emoji[1]
  end
  newHash
end


def get_japanese_emoticon(filename, emoticon)
  emoticons = load_library(filename)
  if emoticons["get_emoticon"][emoticon]
    return emoticons["get_emoticon"][emoticon]
  end
  "Sorry, that emoticon was not found"
end


def get_english_meaning(filename, emoticon)
  emoticons = load_library(filename)
  if emoticons["get_meaning"][emoticon]
    return emoticons["get_meaning"][emoticon]
  end
  "Sorry, that emoticon was not found"
end