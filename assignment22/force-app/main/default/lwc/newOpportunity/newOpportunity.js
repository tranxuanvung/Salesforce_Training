import { LightningElement, api, wire, track} from 'lwc';
import { getRecord} from 'lightning/uiRecordApi';
import createOpp from '@salesforce/apex/oppController.createOpp';

export default class NewOpportunity extends LightningElement {
    @api recordId;
    @track record;
    @track error;
    
    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name']}) 
    loadRecord({ error, data }) {
      if (error) {
        // TODO: handle error
        this.record = undefined;
        this.error = error;
      } else if (data) {
        // Get account data
        this.record = data;
        this.error = undefined;
      }
    }

    handleClick(event){
      createOpp({accountId:this.recordId})
      .then((res)=>{
        window.location.href = `/lightning/r/Opportunity/${res}/view`;
      })
      .catch((err)=>{
        console.error(err);
      });
    }

    get name(){
      return this.record.fields.Name.value;
    }
}