/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 28-06-2023
 * @last modified by  : Muriel Proton
**/
public with sharing class ContactGet {
    public static List<Contact> getContactListByLastName(String contactLastName){

        checkPermissionContact();

        List<Contact> contactListToReturn = [SELECT Id,
                                                    LastName,
                                                    Birthdate,
                                                    Activated__c
                                            FROM Contact
                                            WHERE LastName= :contactLastName 
                                            ];
        return contactListToReturn;
    }
    public static List<Contact> getContactListByActivatedFalse(){
        checkPermissionContact();

        List<Contact> contactListToReturn = [SELECT Id,
                                                    LastName,
                                                    Activated__c
                                            FROM Contact
                                            WHERE Activated__c = false 
                                            ];
        return contactListToReturn;
    }
        /**
    * @description Validate CRUD permission before SOQL/DML operation (rule: Security-ApexCRUDViolation) Apex PMD
    * @author Muriel Proton | 13-02-2023 
    **/
   private static void checkPermissionContact(){
    if( !Contact.SObjectType.getDescribe().isAccessible() 
        || !Schema.SObjectType.Contact.fields.LastName.isAccessible()
    ){
        throw new CRUDPermissionBeforSOQLDMLException('You have no permission to get a Contact record.');
    }
}
}