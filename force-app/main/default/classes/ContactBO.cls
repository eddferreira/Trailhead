public without sharing class ContactBO {
    private static final ContactBO instancia = new ContactBO();
    private Util mask = new Util();
    public static ContactBO getInstance() {
        return instancia;
    }
    public class ContactBOException extends Exception{}
    
    private ContactBO(){}

    public void PhoneMask(List<Contact> contactList){

        for(Contact contactNew : contactList){

            String phone = mask.removeNonNumber(contactNew.phone);
             
            contactNew.Phone = mask.formatPhone(phone);
        }
    }
}