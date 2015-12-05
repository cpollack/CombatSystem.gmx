/// clearSkills()
//
//  Clears the skills list
//
///

{
    var sCount = instance_number(obj_btnSkill)
    var i = sCount - 1;
    repeat (sCount) {
        with (instance_find(obj_btnSkill,i)) { instance_destroy(); }
        i -= 1;
    }
    return noone;
}
