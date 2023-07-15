import { LightningElement, wire } from 'lwc';
import GetAll from '@salesforce/apex/UserManager.GetAll';


export default class UserList extends LightningElement {
    usersReqeustsWireResult;
    
    @wire(GetAll)
    wiredMyLeaves(result) {
        this.usersReqeustsWireResult = result;
        if (result.data) {
            console.log('result.data', result.data);
        }
        if (result.error) {
            console.log('Error occured while fetching my leaves- ', result.error);
        }
    }
}