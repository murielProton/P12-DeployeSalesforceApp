/**
 * @description       : 
 * @author            : Muriel Proton
 * @group             : 
 * @last modified on  : 23-06-2023
 * @last modified by  : Muriel Proton
**/
public with sharing class ContactTriggerHelper {
    public static Boolean contactExistsAlready(String lastNameAXG){
        List<Contact> contactExisting = ContactGet.getContactListByLastName(lastNameAXG);
        if(contactExisting.size() <=1 ){
            return true;
        }
        return false;
    }
}