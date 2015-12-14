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
        hitPwr = 2;
        hitSpd = 1;
        
        if isHit_byRating(hitRating) {
            update_log("The enemy " + getConditionMessage(obj_enemy));
        }  
        else update_log("The attack missed!");
} }

/*
Combat Workflow:

(Starts with an initiation action)
1: Verify if the hit is on target (hitRating)
1a - HR can be modified by status, stance, offbalance (0.5 = 50% on target)
1b - A miss creates an opportunity which the opponent can exploit

2: Verify if reactor can respond to action (reactionSpd)
2a - RS is based on character stats and modified by response, status, stance

When the hit is on target, and the opponent has an oportunity to react, there is a few different things that can happen:
A) Defensive/Block
B) Technical/Dodge
C) Agressive/Attack
D) Take the blow

3: Get a reaction skill and set the mode for handling the next step

4: Run stat comparison to get results of 'clash'.
4a - Blocks can mitigate the damage, minimizing wound chance or stopping it entirely
4b - Dodges are higher risk, resulting in partially or entirely avoiding attacks. Can create an opportunity
4c - Ignores attacker, leaves user wide open but can entirely stop opponents action. May need a dual-hit system
4d - Damage is taken!

5: Check if damage is sustained
5a - If wound, see if it causes an injury
5b - In the case of an injury, add it to the actor
5c - If fatal, end combat
*/

#define charStats
/*
Character Stats:

Strength [St] - Physical Strength.
Speed [Sp] - Ability to move quickly
Endurance [En] - Physical endurance / Stamina
Will [Wi] - Mental fortitude
Technical Prowess [Tp] - Technical and combat experience

Power [Pw] - St.75 and Sp.25, application of str
Agility [Ag] - Sp.75 and St.25
Reaction speed - Ag.5 and Tp.5, Time it takes to react to any given action
Toughness - En and Wi, ability to sustain dmg without injury
Skill - Wi and Tp, 

*/

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

#define something
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
