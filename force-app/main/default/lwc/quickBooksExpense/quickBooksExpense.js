import { LightningElement, wire } from 'lwc';
import getPaymentAccounts from '@salesforce/apex/QuickBooksAPI.getPaymentAccounts';
import getPaymentAccounts2 from '@salesforce/apex/QuickBooksAPI.getPaymentAccounts2';
import getExpenseCategory from '@salesforce/apex/QuickBooksAPI.getExpenseCategory';
import createExpense from '@salesforce/apex/QuickBooksAPI.createExpense';
import getVendors from '@salesforce/apex/QuickBooksAPI.getVendors';

export default class QuickBooksExpense extends LightningElement {

quickBooksBankAccount;
quickBookCardAccounts;
selectedAccountId;
accountTypeOptions;
selectedAccountBalance;
expenseCategoryData;
expenseCategoryOptions;
accountNameIdMap;
accountNameTypeMap;

//child component rows
category = 'CATEGORY';

categoryDescription = 'DESCRIPTION';
categoryAmount = 'AMOUNT';
categoryBillable = 'BILLABLE';
itemProduct = 'PRODUCT/SERVICE';
itemDescription = 'DESCRIPTION';
itemQuantity = 'QTY';
itemRate = 'RATE';

    @wire(getPaymentAccounts)
    getPaymentAccount({data, error}){
        if(data){
            this.quickBooksBankAccount = data;
            console.log('quickBooksBankAccount' , this.quickBooksBankAccount);
            this.getAccountOptions();
        } 
        else if(error){
            console.log('Error' , error);

        }
    }

    @wire(getPaymentAccounts2)
    getPaymentAccount2({data, error}){
        if(data){
            this.quickBookCardAccounts = data;
            console.log('quickBookCardAccounts' , this.quickBookCardAccounts);
            this.getAccountOptions();

        } 
        else if(error){
            console.log('Error' , error);

        }
    }
    
    accountBalancesMap = new Map();

    getAccountOptions() {
        if (this.quickBooksBankAccount && this.quickBookCardAccounts != null) {
            console.log('In Get Accounts Function');
            try {
                const bankAccounts = JSON.parse(this.quickBooksBankAccount).QueryResponse.Account;
                const cardAccounts = JSON.parse(this.quickBookCardAccounts).QueryResponse.Account;
                const accounts = [...bankAccounts, ...cardAccounts];
                const accountNames = accounts.map(account => account.Name);
                console.log('accountNames' , JSON.stringify(accountNames));

                const accountId = accounts.map(id => id.Id);
                console.log('accountId' , JSON.stringify(accountId));

                this.accountTypeOptions = accountNames.map(name => ({ label: name, value: name }));
                const accountBalance = accounts.map(account => account.CurrentBalance);

                this.accountNameIdMap = new Map(accounts.map(account => [account.Name , account.Id]));
                console.log('accountNameIdMap' , this.accountNameIdMap);

                const accountBalances = new Map(accounts.map(account => [account.Name, account.CurrentBalance]));
                console.log('accountBalances' , accountBalances);
                this.accountBalancesMap = accountBalances;

                this.accountNameTypeMap = new Map(accounts.map(account => [account.Name , account.AccountType]));
                console.log('accountNameTypeMap' , this.accountNameTypeMap);


                console.log('accountBalancesMap' , this.accountBalancesMap);

                console.log('account balance' , JSON.stringify(accountBalance));
                console.log('TYPE' , typeof this.accountTypeOptions);
                console.log('accountTypeOptions' , this.accountTypeOptions);
            } catch (error) {
                console.error(JSON.stringify(error));
            }
        }
    }
    expenseCategoryNameIdMap;

    @wire(getExpenseCategory)
    expenseCategories({data , error}){
        if(data){
            console.log('Expense Category' , data);
            this.expenseCategoryData = data;

            const expenseCategories = JSON.parse(this.expenseCategoryData).QueryResponse.Account;
            const expenseCategoryNames = expenseCategories.map(expenseCategories => expenseCategories.Name);
            const expenseCategoryIds = expenseCategories.map(expenseCategories => expenseCategories.Id);
            this.expenseCategoryNameIdMap = new Map(expenseCategories.map(expenseCategories => [expenseCategories.Name , expenseCategories.Id]));
            console.log('expenseCategoryNameIdMap' , this.expenseCategoryNameIdMap);
            console.log('expenseCategoryIds' , expenseCategoryIds);
            console.log('expenseCategoryNames' , expenseCategoryNames);
            this.expenseCategoryOptions = expenseCategoryNames.map(category => ({ label: category, value: category }));
        }
        else if(error){
            console.log(error);
        }
    }

    vendornamesoptions;
    vendorNameIdMap;
    @wire(getVendors)
    getExpenseVendors({data , error}){
        if(data){
            console.log('Vendor Data' , data);
            const vendorNames = JSON.parse(data).QueryResponse.Vendor;
            console.log('vendorNames' , vendorNames);
            const vendorNameList = vendorNames.map(vendornames => vendornames.DisplayName);
            console.log('vendorNameList' , vendorNameList);
            const vendorId = vendorNames.map(vendorids => vendorids.Id);
            console.log('vendorId' , vendorId);
            this.vendornamesoptions = vendorNameList.map(vendornames => ({ label: vendornames , value: vendornames}));
            this.vendorNameIdMap = new Map(vendorNames.map(vendorNameIds => [vendorNameIds.DisplayName , vendorNameIds.Id]));
            console.log('vendorNameIdMap' , this.vendorNameIdMap);
        }
        else if(error){
            console.log('Vendor Error' , error);
        }
    }

       
    handleAccountChange(event) {
        this.selectedAccountId = event.detail.value;
        console.log('selectedAccountId'  ,this.selectedAccountId);
        this.selectedAccountBalance = this.accountBalancesMap.get(this.selectedAccountId);
        this.selectedAccountBalance = this.selectedAccountBalance.toLocaleString('us-US', { style: 'currency', currency: 'USD' })
        console.log('selectedAccountBalance' , this.selectedAccountBalance.toLocaleString('us-US', { style: 'currency', currency: 'USD' }));

    }

    requestBodyString;
    createExpenseBody(){
        var paymentType;

        const accountName = this.selectedAccountId; 
        const accountId = this.accountNameIdMap.get(accountName);
        const expenseAmount = this.selectedCategoryAmount; 

        if(accountName === 'Visa'){
            paymentType = 'CreditCard';
        }
        else if(accountName === 'Mastercard'){
            paymentType = 'CreditCard';
        }
        else if(accountName === 'Checking'){
            paymentType = 'Cash';
        }
        else if(accountName === 'Savings'){
            paymentType = 'Cash';
        }

        const requestBody = {
        PaymentType: paymentType,
        AccountRef: {
            name: accountName,
            value: accountId
        },
        EntityRef: {
            value: this.vendorNameIdMap.get(this.selectedVendor),
            name: this.selectedVendor,
            type: 'Vendor'
        },
        Line: [
            {
                DetailType: 'AccountBasedExpenseLineDetail',
                Amount: expenseAmount,
                AccountBasedExpenseLineDetail: {
                    AccountRef: {
                        name: this.selectedCategory,
                        value: this.expenseCategoryNameIdMap.get(this.selectedCategory)
                    }
                }
            }
        ]
        };

        this.requestBodyString = JSON.stringify(requestBody);
        console.log('requestBodyString' , this.requestBodyString);
    }

    // handleCreateExpense(){
    //     console.log('Save Clicked');
    //     this.createExpenseBody();

    //     createExpense({reqBody: this.requestBodyString })
    //     .then((result) =>{
    //         console.log('createExpenseResult' , result);
    //     })
    //     .catch((error) =>{
    //         console.log('Create Expense Error' , error);
    //     })
    //     .finally(()=>{
    //         console.log('Expense Created');
    //     });
    // }

    handleCreateExpense(){
        console.log('Save Clicked');
        this.createExpenseBody();
      
        // Get the attachment file content, name, and type
        let fileInput = this.template.querySelector('input[type="file"]');
        console.log('File' , fileInput);
        let file = fileInput.files[0];
        console.log('File Name' , file.name);
        console.log('File Type' , file.type);
        let reader = new FileReader();
        reader.onload = () => {
            let fileContent = reader.result.split(',')[1];
            createExpense({reqBody: this.requestBodyString, attachmentBody: fileContent, attachmentName: file.name, attachmentType: file.type})
            .then((result) =>{
                console.log('createExpenseResult' , result);
            })
            .catch((error) =>{
                console.log('Create Expense Error' , error);
            })
            .finally(()=>{
                console.log('Expense Created');
            });
        };
        reader.readAsDataURL(file);
      }

    childData;
    selectedCategory;
    selectedCategoryAmount;
    handleChildDataChange(event) {
        const data = event.detail;
        console.log('Data from child:', data);
    
        this.selectedCategory = data.category;
        this.selectedCategoryAmount = data.categoryAmount;
    
        console.log('Selected category:', this.selectedCategory);
        console.log('Selected category amount:', this.selectedCategoryAmount);
    }

    selectedVendor;
    handleVendorChange(event){
        this.selectedVendor = event.detail.value;
        console.log('selectedVendor' , this.selectedVendor );


    }
}