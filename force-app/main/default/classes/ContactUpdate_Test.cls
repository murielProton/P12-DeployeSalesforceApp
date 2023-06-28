/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 28-06-2023
 * @last modified by  : Muriel Proton
**/
@isTest
public with sharing class ContactUpdate_Test {
    private static String lastNameForTest = 'Shazam';

    @TestSetup
    static void setupContactGet(){
        List<Contact> contactsList = new List<Contact>();

        Contact contact = new Contact(
                                        LastName = lastNameForTest
                                    );
        contactsList.add(contact);

        if (Schema.sObjectType.Contact.fields.LastName.isCreateable() == false) {
            throw new CRUDPermissionBeforSOQLDMLException('You have no permission to insert a Contact record.');
        }else{
            insert contactsList;
        }
    }

    @isTest
    public static void testUncheckFieldActivatedOnListOfContact(){
        List<Contact> contactList = ContactGet.getContactListByLastName(lastNameForTest);

        Test.startTest();
        ContactUpdate.uncheckFieldActivatedOnListOfContact(contactList);
        Test.stopTest();

        List<Contact> contactListToTest = ContactGet.getContactListByActivatedFalse();

        System.assertEquals( 1, contactListToTest.size(), 'ContactUpdate.uncheckFieldActivatedOnListOfContact(contactList) should update field Activatd to false.' );
    }
}