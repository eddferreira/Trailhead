@isTest
private class TestContactBO{

    @isTest static void TestInsertPhone(){
        Contact ctt1 = new Contact(LastName = 'Nome1', Phone = '(11)99999-9999');
        Contact ctt2 = new Contact(LastName = 'Nome2', Phone = '11999999999');
        Contact ctt3 = new Contact(LastName = 'Nome3', Phone = '119999-9999');
        Contact ctt4 = new Contact(LastName = 'Nome4', Phone = '1199999999');
        Contact ctt5 = new Contact(LastName = 'Nome5', Phone = '+55 (11) 9 9999-55966');
        Contact ctt6 = new Contact(LastName = 'Nome6', Phone = '1199999559669');
        Contact ctt7 = new Contact(LastName = 'Nome7', Phone = '119999955966');
        List<Contact> cttList = new List<Contact>{ctt1,
             //ctt2,
             //ctt3,
             //ctt4,
             //ctt5,
             //ctt6,
             ctt7};

        Test.startTest();
           insert cttList;
        Test.stopTest();

        List<Contact> listaContatoAtualizada = [SELECT Id, Name, Phone FROM Contact];
        // + (XX) X XXXX-XXXX

        System.assertEquals(2,listaContatoAtualizada.size(), 'Tamanho da lista incorreto' );

        for(Contact cont : listaContatoAtualizada){
            if(cont.Name == 'Nome1'){
                System.assertEquals('+55 (11) 9 9999-9999',cont.Phone, 'Padrao incorreto: '+cont.Phone+' esperava: +55 (11) 9 9999-9999' );
            }
            if(cont.Name == 'Nome7'){
                System.assertEquals('+55 (11) 9 9999-5596',cont.Phone, 'Padrao incorreto: '+cont.Phone+' esperava: +55 (11) 9 9999-5596' );
            }
        }

    }
}