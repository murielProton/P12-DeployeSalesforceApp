/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 26-06-2023
 * @last modified by  : Muriel Proton
**/
@isTest
public with sharing class ContactTrigger_Test {
    private static String lastNameForTest = 'Shazam';

    @TestSetup
    static void setupContactTrigger() {
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
    public static void testContactTriggerExistant (){
        List<Contact> contactsList = new List<Contact>();

        Contact contact = new Contact(
                                        LastName=lastNameForTest,
                                        Birthdate = date.newInstance(2042, 4, 1)
                                    );
        contactsList.add(contact);
        Test.startTest();
        if (Schema.sObjectType.Contact.fields.LastName.isCreateable() == false) {
            throw new CRUDPermissionBeforSOQLDMLException('You have no permission to insert a Contact record.');
        }else{
            insert contactsList;
        }
        Test.stopTest();
        // TODO create a JSON file
        System.assertEquals('TODO JSON file', 'TODO JSON file', 'The Contact record should have been inserted in a JSON file, with a Salesforce ID.');
    }
    @isTest
    public static void testContactTriggerNew (){
        List<Contact> contactsList = new List<Contact>();

        Contact contact = new Contact(
                                        LastName='Miss Invisible'
                                    );
        contactsList.add(contact);
        Test.startTest();
        if (Schema.sObjectType.Contact.fields.LastName.isCreateable() == false) {
            throw new CRUDPermissionBeforSOQLDMLException('You have no permission to insert a Contact record.');
        }else{
            insert contactsList;
        }
        Test.stopTest();
        List<Contact> contactsListToTestOne = ContactGet.getContactListByLastName('Miss Invisible');
        System.assertEquals(1, contactsListToTestOne.size(), 'The Contact record should have been inserted.');
    }
    @isTest
    public static void testContactTriggerDelete (){

        List<Contact> contactsList = ContactGet.getContactListByLastName(lastNameForTest);
        Test.startTest();
        try {
            delete contactsList;
        } catch (DmlException e) {
            System.debug('deletion was not possible.');
        }
        Test.stopTest();
        // TODO create a JSON file
        List<Contact> contactsList = ContactGet.getContactListByLastName(lastNameForTest);

        System.assertEquals(0, contactsList.size(), 'The Contact record should not be deleted but deactivated.');
    }
}