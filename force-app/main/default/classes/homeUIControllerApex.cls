public with sharing class homeUIControllerApex {
    public static decimal currentMonthcount; //This Month Expense Count Store
    public static decimal currentMonthRecords; // This Month Expense Record Count Store
    public static decimal lastMonthRecords; //Last Month Expense Record Count
    public static decimal sumNull; // When sum(amount) == null and assign to 0;
    public static decimal result; // Formula Result 
    public static decimal resultround; // Round off (2)
    public static decimal currentMonthRecordAmount; //This Month Expense Record Amount Store
    public static decimal result2; // Formula Result 
    public static decimal resultround2; // Round off (2)
    public static decimal nulvalue1; // Used to store (Current Month Amount)
    public static decimal nulvalue2; // Used to store (last Month Amount)
     public static decimal rcurrentMonthcount; //This Month reimbursement Count Store
    public static decimal rcurrentMonthRecords; // This Month reimbursement Record Count Store
    public static decimal rlastMonthRecords; //Last Month reimbursement Record Count
    public static decimal rresult; //  reimbursement Formula Result 
    public static decimal rresultround; // reimbursement Round off (2)
    public static decimal rcurrentMonthRecordAmount; //This Month reimbursement Record Amount Store
    public static decimal rresult2; // reimbursement Formula Result 
    public static decimal rresultround2; //reimbursement Round off (2)
    public static decimal rnulvalue1;   // Store reimbursement currentMonthAmount in getcurrentMonthAmount Method
    public static decimal rnulvalue2; //Store reimbursement currMonthAmount
    public static decimal rnulvalue3; // Store reimbursement lastMonthAmount
    
    //*Expense Component *
    @AuraEnabled
    public static decimal getCurrentMonth(){
        
        decimal currentMonth=[SELECT count() FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and (salestrip__Status__c !='Reimbursed' and salestrip__Status__c !='Cancelled')];
        //currentMonthRecords=currentMonth;
        if(currentMonth != null){
            currentMonthcount=currentMonth;
        }else{
            currentMonth=0;
             currentMonthcount=currentMonth;
        }
        system.debug('THIS Month Records ===>'+ currentMonth);
        return currentMonthcount;
    }
    //Get Current and Last Month Expense Count
    @AuraEnabled
    public static decimal getCurrentLastExpenseRecord(){
        decimal currMonth=[SELECT count() FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and (salestrip__Status__c !='Reimbursed' and salestrip__Status__c !='Cancelled') ];
        decimal lastRec=[select count() from salestrip__Expense__c where salestrip__Date__c = LAST_MONTH and (salestrip__Status__c !='Reimbursed' and salestrip__Status__c !='Cancelled')];
        
        system.debug(lastRec);
        if(currMonth !=null){     //check the null
            
            currentMonthRecords=currMonth;

        }else{
            currMonth=0; 
            currentMonthRecords=currMonth;

        }
        
        if(lastRec !=null){
          
            lastMonthRecords=lastRec;
        }else{
          
            lastRec=0;
             
            lastMonthRecords=lastRec;
           
        }
        if(lastMonthRecords==0){
            result=(currentMonthRecords-lastMonthRecords)/currentMonthRecords;
            resultround=result.setScale(2);
            system.debug(resultround); 
            
        }else if(currentMonthRecords==0){
            result=(currentMonthRecords-lastMonthRecords)/lastMonthRecords;
            resultround=result.setScale(2);
            system.debug(resultround);                 
        }else if(lastMonthRecords==0 && currentMonthRecords==0){
            result=0;
            resultround=result;      
        }else{
            result=(currentMonthRecords-lastMonthRecords)/lastMonthRecords;
            resultround=result.setScale(2);
            system.debug(resultround); 
        }
        
        return resultround;
    }
    //Get the SUM(Amount) for Current Amount Expense
    @AuraEnabled
    public static decimal getcurrentMonthAmount(){
        List<AggregateResult> currentMonthAmount=[SELECT SUM(salestrip__Amount__c) doc  FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and (salestrip__Status__c !='Reimbursed' and salestrip__Status__c !='Cancelled') ];
        system.debug('THIS Month Records ===>'+ currentMonthAmount);
        String str1 = String.valueOf(currentMonthAmount[0].get('doc')) ; // Intially, it stores 'String'
        if(str1 != null){
            sumNull=Decimal.valueOf(str1) ; //Covert from string to Decimal

        }else{
            sumNull=0;
        }
        system.debug(sumNull);
        return sumNull;
    }

    @AuraEnabled
    public static decimal getlastMonthAmount(){ 
        List<AggregateResult> currMonthAmount=[SELECT SUM(salestrip__Amount__c) coram  FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and (salestrip__Status__c !='Reimbursed' and salestrip__Status__c !='Cancelled')];
        List<AggregateResult> lastMonthAmount=[SELECT SUM(salestrip__Amount__c) amt FROM salestrip__Expense__c where salestrip__Date__c  = LAST_MONTH and (salestrip__Status__c !='Reimbursed' and salestrip__Status__c !='Cancelled') ];
        system.debug('Last Month Records ===>'+ lastMonthAmount);
        String str2 = String.valueOf(currMonthAmount[0].get('coram')) ;
        if(str2 !=null){
            nulvalue1=Decimal.valueOf(str2) ;

        }else{
            nulvalue1=0;

        }
         currentMonthRecordAmount=nulvalue1; // Assign to Current Month Amount
        String str3 = String.valueOf(lastMonthAmount[0].get('amt')) ;
        if(str3 !=null){
           
            nulvalue2 = Decimal.valueOf(str3) ;
           system.debug(nulvalue2);
       }else{
           
           nulvalue2=0;
           system.debug(nulvalue2);
            
       }
        
        if(nulvalue2==0){
        result2=(currentMonthRecordAmount-nulvalue2)/currentMonthRecordAmount;
        resultround2=result2.setScale(2);
        system.debug(result2);
        system.debug(resultround2);
            
        }else if(currentMonthRecordAmount==0){
        result2=(currentMonthRecordAmount-nulvalue2)/nulvalue2;
        resultround2=result2.setScale(2);
        system.debug(result2);
        system.debug(resultround2);
            
        }else if(nulvalue2==0 && currentMonthRecordAmount==0 ){
         result2=0;
        resultround2=result2;
            
        }else{
        result2=(currentMonthRecordAmount-nulvalue2)/nulvalue2;
        resultround2=result2.setScale(2);
        system.debug(result2);
        system.debug(resultround2);
        }
        return resultround2;  
    }
    
    //*Reimbursement Component*//
    
    /*
    @AuraEnabled
    public static decimal getReimburseAmount(){
        list<AggregateResult> result=new list<AggregateResult>();
        result=[SELECT sum(salestrip__Amount__c)num FROM salestrip__Expense__c where salestrip__status__c='Reimbursed' WITH SECURITY_ENFORCED ];
        String str=String.valueOf(result[0].get('num'));
        decimal number1=decimal.valueOf(str);
        system.debug('String ===>' + str);
        system.debug('String ===>' + number1 );
        return number1;
    }
    
    @AuraEnabled
    public static integer getReimburse(){
        integer i=[select count() from salestrip__Expense__c where salestrip__status__c='Reimbursed' WITH SECURITY_ENFORCED ];
        system.debug('Expesne Records ======>'+ i);
        return i;
    }
    */
    @AuraEnabled
    public static decimal getrCurrentMonth(){
        
        decimal currentMonth=[SELECT count() FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and salestrip__Status__c='Reimbursed'];
        //currentMonthRecords=currentMonth;
        if(currentMonth != null){
           
            rcurrentMonthcount=currentMonth;
        }else{
            currentMonth=0;
             rcurrentMonthcount=currentMonth;
            
        }
        system.debug('THIS Month Records ===>'+ currentMonth);
        return rcurrentMonthcount;
    }
    @AuraEnabled
    public static decimal getrCurrentLastExpenseRecord(){
        decimal rcurrMonth=[SELECT count() FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and salestrip__Status__c='Reimbursed'];
        decimal rlastRec=[select count() from salestrip__Expense__c where salestrip__Date__c =LAST_MONTH and salestrip__Status__c='Reimbursed'];
        //rlastMonthRecords=lastRec;
        //rcurrentMonthRecords=currMonth;
         if(rcurrMonth !=null && rcurrMonth >0){
            
            rcurrentMonthRecords=rcurrMonth;

         }else if(rcurrMonth==0){
             rcurrMonth=0;
             rcurrentMonthRecords=rcurrMonth;
         }else{
            rcurrMonth=0;
            rcurrentMonthRecords=rcurrMonth;

        }
        
        if(rlastRec!=null && rlastRec > 0 ){
          
            rlastMonthRecords=rlastRec;
        }else if(rlastRec==0){
            rlastRec=0;
             
            rlastMonthRecords=rlastRec;
        }
        else{
          
            rlastRec=0;
             
            rlastMonthRecords=rlastRec;
           
        }
        if(rlastMonthRecords==0){
            rresult=(rcurrentMonthRecords-rlastMonthRecords)/rcurrentMonthRecords;
            rresultround=rresult.setScale(2);
            system.debug(rresultround); 
            
        }else if(rcurrentMonthRecords==0){
            rresult=(rcurrentMonthRecords-rlastMonthRecords)/rlastMonthRecords;
            rresultround=rresult.setScale(2);
            system.debug(rresultround);                 
        }else if(rlastMonthRecords==0 && rcurrentMonthRecords==0){
            rresult=0;
            rresultround=rresult; 
            system.debug(rresultround); 
        }else{
            rresult=(rcurrentMonthRecords-rlastMonthRecords)/rlastMonthRecords;
            rresultround=rresult.setScale(2);
            system.debug(rresultround); 
        }
        return rresultround;
    }

    @AuraEnabled
    public static decimal getrcurrentMonthAmount(){
        List<AggregateResult> currentMonthAmount=[SELECT SUM(salestrip__Amount__c) doc  FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and salestrip__Status__c='Reimbursed'];
        system.debug('THIS Month Records ===>'+ currentMonthAmount);
        String str1 = String.valueOf(currentMonthAmount[0].get('doc')) ;
        if(str1 !=null){
            rnulvalue1=Decimal.valueOf(str1) ;
        }else{
            rnulvalue1=0;
        }
        //currentMonthRecordAmount=dec2;
        return rnulvalue1;
    }

    @AuraEnabled
    public static decimal getrlastMonthAmount(){ 
        List<AggregateResult> currMonthAmount=[SELECT SUM(salestrip__Amount__c) conram  FROM salestrip__Expense__c where salestrip__Date__c  = THIS_MONTH and salestrip__Status__c='Reimbursed'];
        List<AggregateResult> lastMonthAmount=[SELECT SUM(salestrip__Amount__c) amt FROM salestrip__Expense__c where salestrip__Date__c  = LAST_MONTH and salestrip__Status__c='Reimbursed' ];
        system.debug('Last Month Records ===>'+ lastMonthAmount);
        String str2 = String.valueOf(currMonthAmount[0].get('conram')) ;
        
        if(str2 !=null){
            rnulvalue2=Decimal.valueOf(str2) ;
        }else{
            rnulvalue2=0;

        }
        rcurrentMonthRecordAmount=rnulvalue2;
        String str3 = String.valueOf(lastMonthAmount[0].get('amt')) ;
        if(str3 != null){
            rnulvalue3=Decimal.valueOf(str3);
        }else{
            rnulvalue3=0;
        }
        if(rnulvalue3==0){
             rresult2=(rcurrentMonthRecordAmount-rnulvalue3)/rcurrentMonthRecordAmount;
            resultround2=rresult2.setScale(2);
        }else if(rcurrentMonthRecordAmount==0){
             rresult2=(rcurrentMonthRecordAmount-rnulvalue3)/rnulvalue3;
            rresultround2=rresult2.setScale(2);
        }else if(rnulvalue3==0 && rcurrentMonthRecordAmount==0){
             rresult2=0;
            rresultround2=rresult2;
        }else{
            rresult2=(rcurrentMonthRecordAmount-rnulvalue3)/rnulvalue3;
            rresultround2=rresult2.setScale(2);
            system.debug(rresult2);
            system.debug(rresultround2); 
        }
        return rresultround2;  
    }

    //* Inbox and Dashboard *//
     @AuraEnabled
    public static id getpendinglistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__Expense__c'and name ='Pending Approval' limit 1].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    //list
    @AuraEnabled
    public static id getdraftlistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__Expense__c'and name ='Draft' limit 1].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static id getexpenseReportlistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__ExpenseReport__c'and name ='Draft' WITH SECURITY_ENFORCED].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static id getexpenseReportpendinglistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__ExpenseReport__c'and name ='Pending Approval' WITH SECURITY_ENFORCED].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static id getexpensependingReimburselistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__Expense__c'and name ='Pending Reimbursement' WITH SECURITY_ENFORCED ].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static id getexpenseReimbursedlistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__Expense__c'and name ='Reimbursed' WITH SECURITY_ENFORCED].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static id getReceiptAttachedlistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__Expense__c'and name ='Receipt UnAttached' WITH SECURITY_ENFORCED].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static id getCardUnmappedlistViews(){
        try {
            id listviews =[SELECT Id FROM ListView WHERE SobjectType='salestrip__Transaction__c'and name ='Card UnMapped Transactions' WITH SECURITY_ENFORCED].id;
            system.debug('List View ====>'+ listviews);
            return listviews;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // Badge Only (number)
    @AuraEnabled
    public static integer getdraft(){
        try {
            return [select count() from salestrip__Expense__c where salestrip__Status__c='Draft'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static integer getpendingappr(){
        try {
            return [select count() from salestrip__Expense__c where salestrip__Status__c='Pending Approval'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static integer getexprdraft(){
        try {
            return [select count() from salestrip__ExpenseReport__c where salestrip__Status__c='Draft'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static integer getexprpendingapp(){
        try {
            return [select count() from salestrip__ExpenseReport__c where salestrip__Status__c='Pending Approval'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static integer getpendingreim(){
        try {
            return [select count() from salestrip__Expense__c where salestrip__Status__c='Pending Reimbursement'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }    
    
  

}