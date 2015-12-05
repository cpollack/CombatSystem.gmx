#define scr_combat
/// Library for managing combat
//
//  
//
///

{ switch (mode) {
    case combatMode.action:
        action = get_action(curActor,"Action");
        if (action != noone) {
            curActor = swap_actor(curActor);
            mode = combatMode.reaction;
        }
        break;
    case combatMode.reaction:
        //opp check
        //get react
        reaction = get_action(curActor,"Reaction");
        if (reaction != noone) {
            mode = combatMode.runResults;
        }
        break;
    case combatMode.runResults:
        //Run results and apply
        scr_handle_attack(action);
        //update flow state and reset mode
        action = noone; reaction = noone;
        mode = combatMode.action;        
        break;
} }


#define get_action
/// get_action(actor,mode)
//
//  
//
///

{
    var actor = argument0;
    var mode = argument1;
    if actor.name = "Enemy" { return scr_combatAI(mode); }
    if (pendingAction != noone) { 
        var tSkill = pendingAction;
        pendingAction = noone;
        return tSkill; 
    }
    return noone;
}

#define swap_actor
/// swap_actor(actor)
//
//  
//
///

{
    var actor = argument0;
    if actor = player { return enemy;  }
    if actor = enemy  { return player; }
    return noone;
}
