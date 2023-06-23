/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 23-06-2023
 * @last modified by  : Muriel Proton
**/
@isTest
public with sharing class ContactTriggerHelper_Test {
    private static String lastNameForTest = 'Shazam';

    @TestSetup
    static void setupContactGet(){
        List<Contact> contactsList = new List<Contact>();

        Contact contact = new Contact(
                                        LastName=lastNameForTest
                                    );
        contactsList.add(contact);

        if (Schema.sObjectType.Contact.fields.LastName.isCreateable() == false) {
            throw new CRUDPermissionBeforSOQLDMLException('You have no permission to insert a Contact record.');
        }else{
            insert contactsList;
        }
    }
    @isTest
    public static void testContactExistsAlready() {

        Test.startTest();
        Boolean responseToContactTrue = ContactTriggerHelper.contactExistsAlready(lastNameForTest);
        Boolean responseToContactFalse = ContactTriggerHelper.contactExistsAlready('Miss Invisible');
        Test.stopTest();

        System.assertEquals( true, responseToContactTrue,'ContactTriggerHelper.contactExistsAlready() should return true.');
        System.assertEquals( false, responseToContactFalse,'ContactTriggerHelper.contactExistsAlready() should return false.');
    
    }
}