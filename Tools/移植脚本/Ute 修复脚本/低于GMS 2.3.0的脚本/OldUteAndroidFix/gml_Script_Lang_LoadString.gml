var LANG = argument[0];

if (!Lang_IsExists(LANG))
    return 0;

if (is_real(LANG))
    LANG = Lang_GetName(LANG);

if (!file_exists("locale/" + LANG + "/" + "string.txt"))
    return 0;

var LIST = Lang_LoadFileToString("locale/" + LANG + "/" + "string.txt");
var FILE = file_text_open_from_string(LIST);

while (!file_text_eof(FILE))
{
    var TARGET = file_text_read_string(FILE);
    file_text_readln(FILE);
    var PATH = "locale/" + LANG + "/" + TARGET;
    
    if (file_exists(PATH))
    {
        var STR = Lang_LoadFileToString(PATH);
        var proc = 0;
        var str_mode = 0;
        var str_input_name = 1;
        var str_name = "";
        var str_text = "";
        var MAP = global._gmu_lang_string;
        
        while (string_length(STR) > proc)
        {
            proc += 1;
            var CHAR = string_char_at(STR, proc);
            
            if (CHAR == "\"")
            {
                str_mode = !str_mode;
                
                if (!str_mode)
                {
                    str_input_name = !str_input_name;
                    
                    if (str_input_name)
                    {
                        ds_map_replace(MAP, str_name, str_text);
                        str_name = "";
                        str_text = "";
                    }
                }
            }
            else if (str_mode)
            {
                if (CHAR != "\t" && CHAR != "\n" && CHAR != "\r")
                {
                    if (CHAR == "\\")
                    {
                        proc += 1;
                        CHAR = string_char_at(STR, proc);
                        
                        if (CHAR == "n")
                            CHAR = "\n";
                        
                        if (CHAR == "\\")
                            CHAR = "\\";
                    }
                    
                    if (str_input_name)
                        str_name += CHAR;
                    else
                        str_text += CHAR;
                }
            }
        }
    }
}

file_text_close(FILE);
return 1;
