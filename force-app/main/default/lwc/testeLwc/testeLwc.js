import { LightningElement, track } from 'lwc'
import gravaConta from '@salesforce/apex/AccountCreate.gravaConta';

export default class TesteLwc extends LightningElement {
    nomeConta;

    salvaNome(event){
        this.nomeConta = event.target.value;
    }

    gravaNome(event){
        if(this.nomeConta){
            gravaConta({nome : this.nomeConta});

            this.nomeConta = '';
        }
    }
}