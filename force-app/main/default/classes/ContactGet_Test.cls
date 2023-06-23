/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 23-06-2023
 * @last modified by  : Muriel Proton
**/
@isTest
public with sharing class ContactGet_Test {
    private static String lastNameForTest = 'Shazam';

    @TestSetup
    static void setupContactGet(){
        List<Contact> contactsList = new List<Contact>();
        System.debug('Coucou');
        System.debug(lastNameForTest);

        Contact contact = new Contact(
                                        LastName=lastNameForTest
                                    );
        System.debug('contact ' + contact);
        contactsList.add(contact);
        System.debug('contactsList ' + contactsList);

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
        System.debug('contactsListToTestOne ' + contactsListToTestOne);
        List<Contact> contactsListToTestZero = ContactGet.getContactListByLastName('Miss Invisible');
        Test.stopTest();

        System.assertEquals( 1, contactsListToTestOne.size(),'ContactGet.getContactListByLastName() should return a list of five records.');
        System.assertEquals( 0, contactsListToTestZero.size(),'ContactGet.getContactListByLastName() should return a list of five records.');
    
    }
}