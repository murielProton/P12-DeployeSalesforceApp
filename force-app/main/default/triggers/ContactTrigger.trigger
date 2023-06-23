/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 23-06-2023
 * @last modified by  : Muriel Proton
**/
trigger ContactTrigger on Contact (before insert) {
    new ContactTriggerHandler().run();

}
