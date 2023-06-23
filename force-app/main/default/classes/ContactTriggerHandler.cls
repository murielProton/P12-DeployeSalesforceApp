/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 23-06-2023
 * @last modified by  : Muriel Proton
**/
public with sharing class ContactTriggerHandler extends TriggerHandler{

    List<Contact> contactListOld =(List<Contact>)Trigger.old;
    List<Contact> contactListNew =(List<Contact>)Trigger.new;

    Map<Id, Contact> contactMapOld = (Map<Id, Contact>)Trigger.oldMap;
    Map<Id, Contact> contactMapNew = (Map<Id, Contact>)Trigger.newMap;

    /**
    * @description Trigger Handler on Contact implements the native method beforeInsert()
    * @author Muriel Proton | 13-02-2023 
    **/
    public override void beforeInsert() {
    /*If the Contact exists export JSON file with this Contact's ID in Salesforce
     * AND update the Contact in Salesforce
     * If this Contact's record existe only in CRM AXG, create this new record in Salesforce Contact
     * TODO : Implement the methode in ContactTriggerHelper*/

    }
    public override void beforeDelete(){
        /* If CRM AXG delets a Contact record, it must be deactivated in Salesforce AND NEVER deleted.
         *  TODO : Implement the methode in ContactTriggerHelper*/
    }

}