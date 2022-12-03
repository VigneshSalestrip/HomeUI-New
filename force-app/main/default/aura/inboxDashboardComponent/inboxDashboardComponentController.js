({  //Draft 
    draftitem: function(component, event, helper) {
        var action= component.get("c.getdraftlistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            //Navigation - Navigate to list View page ** (Predefined list view) **
            var navService = component.find("navService");
        console.log("Entered 3");   
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__Expense__c',  
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    },
    //Pending Approval
	pendingitem: function(component, event, helper) {
        var action= component.get("c.getpendinglistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            
            var navService = component.find("navService");
        console.log("Entered 3");
          
          
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__Expense__c',
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    },
    //Expense Report Draft Status
	reportdraft: function(component, event, helper) {
        var action= component.get("c.getexpenseReportlistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            
            var navService = component.find("navService");
        console.log("Entered 3");
          
          
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__ExpenseReport__c',
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    },
    // Expense Report Pending Approval Status
	reportpending: function(component, event, helper) {
        var action= component.get("c.getexpenseReportpendinglistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            
            var navService = component.find("navService");
        console.log("Entered 3");
          
          
            
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__ExpenseReport__c',
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    },
    //Expense - Pending Reimbursement Status
	pendingreimbursement: function(component, event, helper) {
        var action= component.get("c.getexpensependingReimburselistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            
            var navService = component.find("navService");
        console.log("Entered 3");
          
          
          
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__Expense__c',
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    },
    // Expense Reimbursed Status 
	reimburseditem: function(component, event, helper) {
        var action= component.get("c.getexpenseReimbursedlistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            
            var navService = component.find("navService");
        console.log("Entered 3");
          
          
     
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__Expense__c',
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    },
    //Receipt Unattached List View
	receiptitem: function(component, event, helper) {
        var action= component.get("c.getReceiptAttachedlistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            
            var navService = component.find("navService");
        console.log("Entered 3");
          
       
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__Expense__c',
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    },
    //Card Unmapped Transactions List View
	cardunmapped: function(component, event, helper) {
        var action= component.get("c.getCardUnmappedlistViews");
        action.setCallback(this,function(response){
            var state = response.getState();
             console.log("Enter 1");
            if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
                console.log(listviews);
            }
            
            var navService = component.find("navService");
        console.log("Entered 3");
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName:'salestrip__Transaction__c',
                actionName: 'list'
            },
            state:{
                
                filterName:listviews
            }
           
        };
            console.log("Entered 4");
        navService.navigate(pageReference);
        console.log("Entered 5");
            
            
        })
        
        console.log("Enter 6");
       $A.enqueueAction(action);
    } ,
	// Bulk Expense Approval Tab
	bulkexpense: function(component, event, helper) {        
         
		 var navService = component.find("navService");
       
         var pageReference = {
            type: 'standard__navItemPage',
            attributes: {
                apiName:'salestrip__BulkApproval'
            }
           
		   };

           navService.navigate(pageReference);
    },

      
    // Review my Expenses Tab
	
	reviewmy: function(component, event, helper) {
		var navService = component.find("navService");
	   var pageReference = {
		type: 'standard__navItemPage',
		attributes: {
			apiName:'salestrip__ReviewMyExpenses'
		}
	   
	   };

	   navService.navigate(pageReference);
    }, 
    // * * Update Notifications badge * *
    //Initial page load datas
    doinit: function(component, event, helper){
       //Draft Count
        var action1=component.get("c.getdraft");
        console.log("Enter doinit");
        action1.setCallback(this,function(response){
            component.set("v.draft",response.getReturnValue());

        });
        $A.enqueueAction(action1);
        //Pending Approval Count
        var action1=component.get("c.getpendingappr");
        console.log("Enter doinit");
        action1.setCallback(this,function(response){
            component.set("v.pendingapp",response.getReturnValue());

        });
        $A.enqueueAction(action1);
        // Expense Report draft Count
        var action1=component.get("c.getexprdraft");
        console.log("Enter doinit");
        action1.setCallback(this,function(response){
            component.set("v.exprdraft",response.getReturnValue());
            
        });
        $A.enqueueAction(action1);
         // Expense Report Pending Approval Count
        var action1=component.get("c.getexprpendingapp");
        console.log("Enter doinit");
        action1.setCallback(this,function(response){
            component.set("v.exprpendingapp",response.getReturnValue());

        });
        $A.enqueueAction(action1);
        //Expense Pending Reimbursement status count
        var action1=component.get("c.getpendingreim");
        console.log("Enter doinit");
        action1.setCallback(this,function(response){
            component.set("v.pendingreim",response.getReturnValue());

        });
        $A.enqueueAction(action1);
    }
})