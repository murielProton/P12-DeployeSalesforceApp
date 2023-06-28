/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 28-06-2023
 * @last modified by  : Muriel Proton
**/
public with sharing class ContactUpdate {
    public static void uncheckFieldActivatedOnListOfContact(List<Contact> contactList){
        List<Contact> contactListToUpdate = new List<Contact>();
        
        for(Contact contactCurrent : contactList){
            contactCurrent.Activated__c = false;
            contactListToUpdate.add(contactCurrent);
        }
        checkPermissionAndUpdateContact(contactListToUpdate);
    }
    public static void checkPermissionAndUpdateContact(List<Contact> contactListToUpdate){
        if (Schema.sObjectType.Contact.fields.Activated__c.isUpdateable() == false) {
            throw new CRUDPermissionBeforSOQLDMLException('You have no permission to update the field Activated__c on Contact records.');
        }else{
            update contactListToUpdate;
        }
    }
}