public without sharing class CEPDTO {
    private static final CEPDTO instancia = new CEPDTO();
    public static CEPDTO getInstance() {
        return instancia;
    }
    public class CEPDTOException extends Exception {	}

    public CEPDTO() {}

    public class CEPRequest{
        public String cep {get;set;}
        
        public CEPRequest(String cep){
            this.cep = IntegrationUtils.getInstance().removeNonNumbers(cep);
        }
    }
    
    public class CEPResponse{
    @AuraEnabled public String cep {get;set;}
    @AuraEnabled public String logradouro {get;set;}
    @AuraEnabled public String complemento {get;set;}
    @AuraEnabled public String bairro {get;set;}
    @AuraEnabled public String localidade {get;set;}
    @AuraEnabled public String uf {get;set;}
    //@AuraEnabled public String ibge {get;set;}
    //@AuraEnabled public String gia {get;set;}
    @AuraEnabled public String ddd {get;set;}
    //@AuraEnabled public String siafi {get;set;}

        public CEPResponse parse(String entrance){
            CEPResponse cepToReturn = new CEPResponse();
            try {
                cepToReturn = (CEPResponse) JSON.deserialize(entrance,CEPResponse.class);
            } catch (Exception e) {
                throw new CEPDTOException('Error on CEPResponse.parse - '+e.getLineNumber()+' - '+ e.getMessage() +' - ' +e.getCause());
            }
            return cepToReturn;
        }

        public List<CEPResponse> listParse(String entrance){
            List<CEPResponse> cepToReturn = new List<CEPResponse>();
            try {
                cepToReturn = (List<CEPResponse>) JSON.deserialize(entrance,List<CEPResponse>.class);
            } catch (Exception e) {
                throw new CEPDTOException('Error on CEPResponse.listParse - '+e.getLineNumber()+' - '+ e.getMessage() +' - ' +e.getCause());
            }
            return cepToReturn;
        }
    }
}