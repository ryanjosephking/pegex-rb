##
# = Pegex Grammar module for pegex
#

# Note: This is a generated file. However, I won't tell you not to edit,
# because... who am I to say?

class Grammar
    def initialize
        @tree = {"+grammar"=>"pegex", "+top"=>"grammar", "+version"=>"0.0.1", "all_group"=>{"+min"=>1, ".ref"=>"rule_part", ".sep"=>{".rgx"=>"\\s*"}}, "any_group"=>{"+min"=>"2", ".ref"=>"rule_part", ".sep"=>{".rgx"=>"\\s*\\|\\s*"}}, "bracketed_group"=>{".all"=>[{".rgx"=>"([\\.]?)\\[\\s*"}, {".ref"=>"rule_group"}, {".rgx"=>"\\s*\\]((?:[\\*\\+\\?]|[0-9]+(?:\\-[0-9]+|\\+)?)?)"}]}, "comment"=>{".rgx"=>"(?:[\\ \\t]*\\r?\\n|\\#.*\\r?\\n)"}, "ending"=>{".rgx"=>"\\s*?(?:\\n\\s*|;\\s*|\\z)"}, "error_message"=>{".rgx"=>"`([^`\\r\\n]*)`"}, "grammar"=>{".all"=>[{".ref"=>"meta_section"}, {".ref"=>"rule_section"}]}, "meta_definition"=>{".all"=>[{".rgx"=>"%"}, {".ref"=>"meta_name"}, {".rgx"=>"[\\ \\t]+"}, {".ref"=>"meta_value"}]}, "meta_name"=>{".rgx"=>"(grammar|extends|include|version)"}, "meta_section"=>{"+min"=>0, ".ref"=>"meta_definition", ".sep"=>{"+bok"=>1, "+eok"=>1, "+min"=>0, "-skip"=>1, ".ref"=>"comment"}}, "meta_value"=>{".rgx"=>"[\\ \\t]*([^;\\n]*?)[\\ \\t]*\\s*?(?:\\n\\s*|;\\s*|\\z)"}, "regular_expression"=>{".rgx"=>"/([^/\\r\\n]*)/"}, "rule_definition"=>{".all"=>[{".rgx"=>"\\s*"}, {".ref"=>"rule_name"}, {".rgx"=>"[\\ \\t]*:\\s*"}, {".ref"=>"rule_group"}, {".ref"=>"ending"}]}, "rule_group"=>{".any"=>[{".ref"=>"any_group"}, {".ref"=>"all_group"}]}, "rule_item"=>{".any"=>[{".ref"=>"rule_reference"}, {".ref"=>"regular_expression"}, {".ref"=>"bracketed_group"}, {".ref"=>"error_message"}]}, "rule_name"=>{".rgx"=>"([a-zA-Z]\\w*)"}, "rule_part"=>{"+max"=>"2", "+min"=>"1", ".ref"=>"rule_item", ".sep"=>{".rgx"=>"\\s*\\s(%{1,3})\\s\\s*"}}, "rule_reference"=>{".rgx"=>"([!=\\+\\-\\.]?)<([a-zA-Z]\\w*)>((?:[\\*\\+\\?]|[0-9]+(?:\\-[0-9]+|\\+)?)?)"}, "rule_section"=>{"+min"=>1, ".ref"=>"rule_definition", ".sep"=>{"+bok"=>1, "+eok"=>1, "+min"=>0, "-skip"=>1, ".ref"=>"comment"}}}
    end
end
