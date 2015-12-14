#define scr_handle_attack
// Handle Attack Skills

var action = argument0;
var reaction = argument1;
if action = noone { return noone; }

update_log(curActor.name + " uses [" + action.name + "]");
with(action) {
switch (name) {
    case "Wild Swing":
        hitRating = 0.5;
        
        if isHit_byRating(hitRating) {
            update_log("The enemy " + getConditionMessage(obj_enemy));
        }  
        else update_log("The attack missed!");
} }

#define isHit_byRating
/// update_log(text)
//
//  Adds new log comment to the bottom of the log
//
///

{
    var hitRating = argument0;
    var tAtk = random(100);
    var hit = false;
    if ((hitRating*100) > tAtk) hit = true;
    return hit;
}

#define getConditionMessage
/// update_log(text)
//
//  Adds new log comment to the bottom of the log
//
///

{
    var tObj = argument0;
    var tAffects = instance_find(tObj,0)
    var tCond, message = "";
    with (tAffects) { tCond = condition; }
    
    var tHit = random(100);
    if (tHit < 51 || tCond = "Injured") { tCond = "Dead"; message = "has been slain."; }
    else { tCond = "Injured"; message = "has been injured."; }
    
    with (tAffects) { condition = tCond; }
    return message;   
}