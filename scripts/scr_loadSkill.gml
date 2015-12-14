/// scr_loadSkill(skillName) - returns ?
//
//  skillName    File identifier for the skill
//
///
var file, line, lineArr;
var skillName = argument0;

file = file_text_open_read(working_directory + "\skills.txt");
while (!file_text_eof(file)) {
    line = string_trim(file_text_readln(file));
    
    var lineL = string_length(line);
    if (is_string(line)) { if (line != "") {
        if (string_copy(line,1,1) == "[") {
            if (string_copy(line,2,string_pos("]",line)-2) == skillName) {
                { do {                
                    line = string_trim(file_text_readln(file));
                    if (is_string(line)) { if (line != "") {
                        lineArr = explode("=",line);
                        var property = lineArr[0];
                        var value = lineArr[1];
                        //do what with this? write it to object somehow
                    } }
                } until (string_length(line) < 3); }
            }
        }    
    } }
}
file_text_close(file);

//?return skill;
