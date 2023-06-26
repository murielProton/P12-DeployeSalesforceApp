/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 26-06-2023
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

        List<Contact> contactListToUpdate = new List<Contact>();
        List<Contact> contactListToInsert = new List<Contact>();

    /*If the Contact exists export JSON file with this Contact's ID in Salesforce
     * AND update the Contact in Salesforce
     * If this Contact's record existe only in CRM AXG, create this new record in Salesforce Contact*/

        for(Contact contactCurrent : contactListNew){
            Boolean doeseTheContactExist = ContactTriggerHelper.contactExistsAlready(contactCurrent.LastName);
            if (doeseTheContactExist){
                contactListToUpdate.add(contactCurrent);
                System.debug('Jexiste déjà.');
            }if (!doeseTheContactExist){
                contactListToInsert.add(contactCurrent);
            }else{
                System.debug('ERROR : Trigger on Contact doese not work for '+contactCurrent.LastName+'.');
            }

        }
        // if the record doese exist update the record. ???
        // if the contact doese exist create a JSON file with the Salesforce record ID.
        //TODO
        for(Contact contactCurrent : contactListToUpdate){
            System.debug('Create A JSON FILE.');

        }
        // If the record doese not exist create a new record on Contact
        if (Schema.sObjectType.Contact.fields.LastName.isCreateable() == false) {
            throw new CRUDPermissionBeforSOQLDMLException('You have no permission to insert an Contact record.');
        }else{
            try {
                insert contactListToInsert;
            } catch(Exception e) {
                System.debug('An unexpected error has occurred while inserting Contact '+contactListToUpdate+': ' + e.getMessage());
            }
        }

    }
    public override void beforeDelete(){
        /* If CRM AXG delets a Contact record, it must be deactivated in Salesforce AND NEVER deleted.
         *  TODO : Implement the methode in ContactTriggerHelper*/
    }

}