file_path = "./lib/emoticons.yml"

#loads the `emoticons.yml` file
def load_library(file_path)
  require "yaml"
  emoticons = YAML.load_file(file_path)
  #=>
      # emoticons = {
      #   "angel"=>["O:)", "☜(⌒▽⌒)☞"],
      #   "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
      #   "bored"=>[":O", "(ΘεΘ;)"],
      #   "confused"=>["%)", "(゜.゜)"],
      #   "embarrased"=>[":$", "(#^.^#)"]
      # }
  #now need to transform the emoticons hash into the right format
  #initiate cleaned emoticons hash
  emoticons_cleaned = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  #set each Japanese emoticon equal to the key in the get_meaning hash
  emoticons.each do |meaning, emoticons|
    emoticons_cleaned["get_meaning"]["#{emoticons[1]}"] = meaning
    emoticons_cleaned["get_emoticon"]["#{emoticons[0]}"] = emoticons[1]
  end
  puts emoticons_cleaned
end

load_library(file_path)
#
# return = {
#   "get_meaning" => {
#     "JAPANESE_EMOTICON_1" => "MEANING_1",
#     "JAPANESE_EMOTICON_2" => "MEANING_2"
#   },
#   "get_emoticon" => {
#     "ENGLISH_EMOTICON_1" =>  "JAPANESE_EMOTICON_1",
#     "ENGLISH_EMOTICON_2" =>  "JAPANESE_EMOTICON_2",
#   }
# }
#
# emoticons = {
#   "angel"=>["O:)", "☜(⌒▽⌒)☞"],
#   "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#   "bored"=>[":O", "(ΘεΘ;)"],
#   "confused"=>["%)", "(゜.゜)"],
#   "embarrased"=>[":$", "(#^.^#)"]
# }
