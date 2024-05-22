public with sharing class util {
    public util() {}

     public String removeNonNumber(String pString){
        pString = pString != null ? pString.replaceAll('[^0-9]','') : null;
        system.debug('teste '+ pString );
        return pString;
    }
   
    public String formatPhone(String phone){
        if(phone.length() == 10){
            String ddd = phone.substring(0,2);
            String inicio = phone.substring(2,6);
            String fim = phone.substring(6);

            phone = String.format('+55 ({0}) {1}-{2}', new List<Object>{ddd,inicio,fim});
           
        } else if(phone.length() == 12){
            String ddd = phone.substring(2,4);
            String inicio = phone.substring(4,8);
            String fim = phone.substring(8);

            phone = String.format('+55 ({0}) {1}-{2}', new List<Object>{ddd,inicio,fim});

        }else if(phone.length() == 11){
            String ddd = phone.substring(0,2);
            String celular = phone.substring(2,3);
            String inicio = phone.substring(3,7);
            String fim = phone.substring(7);

            phone = String.format('+55 ({0}) {1} {2}-{3}', new List<Object>{ddd,celular,inicio,fim});
            
        }else if(phone.length() == 13){
            String ddd = phone.substring(2,4);
            String celular = phone.substring(4,5);
            String inicio = phone.substring(5,9);
            String fim = phone.substring(9);

            phone = String.format('+55 ({0}) {1} {2}-{3}', new List<Object>{ddd,celular,inicio,fim});
        }
        return phone;
    }
   
}