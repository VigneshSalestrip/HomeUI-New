({
    doinit : function(component, event, helper) 
    {  
        // Get Current Month Expense Count 
        var cmonth=component.get("c.getCurrentMonth");
        cmonth.setCallback(this, function(response) 
                           { 
                               var currentmnthrecord=response.getReturnValue();
                               component.set("v.currentMonthRecord",currentmnthrecord);
                           });
        console.log("Enter 4");
        $A.enqueueAction(cmonth);
        //Get Current & last Month Expense Count Comparison
        var lmonth=component.get("c.getCurrentLastExpenseRecord");
        lmonth.setCallback(this, function(response) 
                           {
                               var lastmonthrecord=response.getReturnValue();
                               var convertPercent=$A.localizationService.formatPercent(lastmonthrecord);
                               console.log(convertPercent);
                               if(lastmonthrecord>0){
                                  component.set("v.setBoolean","true");
                                  component.set("v.lastMonthRecord",convertPercent);
                               }else{
                                   component.set("v.setBoolean","false");
                                   component.set("v.lastMonthRecord",convertPercent);
                               }
                           });
        console.log("Enter 4");
        $A.enqueueAction(lmonth);
       // Get Current Month Expense Amount
        var cmonthamount=component.get("c.getcurrentMonthAmount");
        cmonthamount.setCallback(this, function(response) 
                           { 
                               var currentmonthamount =  response.getReturnValue();
                               var conCurrAmount=$A.localizationService.formatCurrency(currentmonthamount);
                               component.set("v.currentMonthAmount",conCurrAmount);
                           });
        console.log("Enter 4");
        $A.enqueueAction(cmonthamount);
        //Get Current & last Month Expense Amount Comparison
        var lmonthamount=component.get("c.getlastMonthAmount");
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