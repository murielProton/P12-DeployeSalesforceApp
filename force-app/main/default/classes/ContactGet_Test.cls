/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 28-06-2023
 * @last modified by  : Muriel Proton
**/
@isTest
public with sharing class ContactGet_Test {
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
    public static void testgetContactListByLastName(){
        
        Test.startTest();
        List<Contact> contactsListToTestOne = ContactGet.getContactListByLastName(lastNameForTest);
        List<Contact> contactsListToTestZero = ContactGet.getContactListByLastName('Miss Invisible');
        Test.stopTest();

        System.assertEquals( 1, contactsListToTestOne.size(),'ContactGet.getContactListByLastName() should return a list of one record.');
        System.assertEquals( 0, contactsListToTestZero.size(),'ContactGet.getContactListByLastName() should return a list of one record.');
    
    }

    @isTest
    public static void testGetContactListByActivatedFalse(){
        List<Contact> contactList = ContactGet.getContactListByLastName(lastNameForTest);

        ContactUpdate.uncheckFieldActivatedOnListOfContact(contactList);

        Test.startTest();
        List<Contact> contactListToTest = ContactGet.getContactListByActivatedFalse();
        Test.stopTest();

        System.assertEquals( 1, contactListToTest.size(), 'ContactGet.getContactListByActivatedFalse() should return a list of Contacts.' );
    }
}