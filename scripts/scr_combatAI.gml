/// Library for AI opponent to choose their next action
//
//  
//
///

// As attacker, always attack
// As defender, always block

var type = argument0;

if (type = "Action")   tName = "Wild Swing";
if (type = "Reaction") tName = "Block";
tSkill = instance_create(0,0,obj_skill);
tSkill.name = tName;
return tSkill;
