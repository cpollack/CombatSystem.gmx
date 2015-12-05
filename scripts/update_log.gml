#define update_log
/// update_log(text)
//
//  Adds new log comment to the bottom of the log
//
///

{
    var text = argument0; tText = "";
    var tLog = instance_find(obj_log,0);
    with (tLog) {
        var i = 9;
        repeat ( 10 ) {
            if log[i] = "" { log[i] = text; break; }
            else {
                tText = log[i];
                log[i] = text;
                text = tText;                
            }
            i -= 1;
        }
        visible = true;
    }
    return noone;
}

#define hideLog
/// hideLog()
//
//  
//
///

{
    with (instance_find(obj_log,0)) {
        visible = false;
    }
    return noone;
}