import { LightningElement, wire , api , track } from 'lwc';

export default class AddRemoveRows extends LightningElement {

    keyIndex = 0;

    @api row1;
    @api row2;
    @api row3;
    @api row4;
    @api expenseCategoryOptions;
    objRow;
    @track rows = [];
    

    connectedCallback() {
        this.handleAddRow();
    }

    category;
    categoryDescription;
    categoryAmount;
    categoryBillable;

    handleChange(event) {
        if (event.target.name == 'custom0') {
            console.log(event.target.value);
            this.category = event.target.value;
            this.handleDataChange();
        }
        else if (event.target.name == 'custom1') {
            console.log(event.target.value);
            this.categoryDescription = event.target.value;
            this.handleDataChange();
        }
        else if (event.target.name == 'custom2') {
            console.log(event.target.value);
            this.categoryAmount = event.target.value;
            this.handleDataChange();
        }
        else if (event.target.name == 'custom3') {
            console.log(event.target.value);
            this.categoryBillable = event.target.value;
            this.handleDataChange();
        }
    }

    handleDataChange() {
        console.log('Data Change Called');
        const data = {
            category: this.category,
            categoryDescription: this.categoryDescription,
            categoryAmount: this.categoryAmount,
            categoryBillable: this.categoryBillable
        };
    
        const changeEvent = new CustomEvent('changedata', { detail: data });
    
        this.dispatchEvent(changeEvent);
        console.log('Event Dispatched');
    }

    handleAddRow() {
        this.rows.push({
            row1: '',
            row2: '',
            row3: '',
            row4: '',
            id: ++this.keyIndex
        });
        console.log(JSON.stringify(this.rows));
    }

    handleRemoveRow(event) {
        if (this.rows.length > 1) {
            this.rows = this.rows.filter((ele) => {
                return parseInt(ele.id) !== parseInt(event.currentTarget.dataset.index);
            });
        }
    }

    processErrorMessage(message) {
        let errorMsg = '';
        if (message) {
            if (message.body) {
                if (Array.isArray(message.body)) {
                    errorMsg = message.body.map(e => e.message).join(', ');
                } else if (typeof message.body.message === 'string') {
                    errorMsg = message.body.message;
                }
            }
            else {
                errorMsg = message;
            }
        }
    }

    renderedCallback() {
        console.log(this.rows);
    }
}