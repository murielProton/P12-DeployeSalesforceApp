/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 26-06-2023
 * @last modified by  : Muriel Proton
**/
public with sharing class ContactGet {
    public static List<Contact> getContactListByLastName(String contactLastName){

        checkPermissionContact();

        List<Contact> contactListToReturn = [SELECT Id,
                                                    LastName,
                                                    Birthdate
                                            FROM Contact
                                            WHERE LastName= :contactLastName 
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