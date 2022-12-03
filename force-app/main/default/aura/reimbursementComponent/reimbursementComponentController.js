({  //Initialize 
    doinit : function(component, event, helper) {

        /*
         var number = component.get("c.getReimburse");
        console.log("Enter 1");
        
        number.setCallback(this, function(response) 
                           {
                               component.set("v.totalreimburse", response.getReturnValue());
                           });
        console.log("Enter 2");
        $A.enqueueAction(number);
        
        var getamount=component.get("c.getReimburseAmount");
        console.log("Enter 3");
        getamount.setCallback(this, function(response){
            var amountCon= response.getReturnValue();
            var convAmount=$A.localizationService.formatCurrency(amountCon);
           
                component.set("v.totalreimburseamount", convAmount);
            
        });
        $A.enqueueAction(getamount);
        console.log("Enter 4");
         */

        //Get Current Month Expense Reimbursed Count 
        var cmonth=component.get("c.getrCurrentMonth");
        cmonth.setCallback(this, function(response) 
                           { 
                               var currentmnthrecord=response.getReturnValue();
                               component.set("v.currentMonthRecord",currentmnthrecord);
                           });
        console.log("Enter 4");
        $A.enqueueAction(cmonth);
        // Get Current & last Month Expense Reimbursed Count Comparison 
        var lmonth=component.get("c.getrCurrentLastExpenseRecord");
        lmonth.setCallback(this, function(response) 
                           { 
                            
                               var lastmonthrecord=response.getReturnValue();
                               console.log(lastmonthrecord);
                               var convertPercent=$A.localizationService.formatPercent(lastmonthrecord); // Format to percent (x 100)
                               console.log(convertPercent);
                               if(lastmonthrecord>0){
                                  
                                  component.set("v.setBoolean","true");
                                  component.set("v.lastMonthRecord",convertPercent); //Set to the Attribute

                               }else{
                                 
                                   component.set("v.setBoolean","false");
                                   component.set("v.lastMonthRecord",convertPercent);
                               }
                           });
        console.log("Enter 4");
        $A.enqueueAction(lmonth);
       //Get Current Month Expense Reimbursed Amount (Spend) 
        var cmonthamount=component.get("c.getrcurrentMonthAmount");
        cmonthamount.setCallback(this, function(response) 
                           { 
                               var currentmonthamount =  response.getReturnValue();
                               var conCurrAmount=$A.localizationService.formatCurrency(currentmonthamount);
                               component.set("v.currentMonthAmount",conCurrAmount);
                           });
        console.log("Enter 4");
        $A.enqueueAction(cmonthamount);
        //Get Current & last Month Expense Reimbursed Amount Comparison
        var lmonthamount=component.get("c.getrlastMonthAmount");
        lmonthamount.setCallback(this, function(response) 
                           { 
                               var lastmonthamount=response.getReturnValue();
                               var convertAmountPercent=$A.localizationService.formatPercent(lastmonthamount);
                               if(lastmonthamount>0){
                                
                                component.set("v.amountBoolean","true");
                                component.set("v.lastMonthAmount",convertAmountPercent);
                                
                               }else{
                               
                                component.set("v.amountBoolean","false");
                                component.set("v.lastMonthAmount",convertAmountPercent);

                               }
                           });
        console.log("Enter 4");
        $A.enqueueAction(lmonthamount);
        


    }
})