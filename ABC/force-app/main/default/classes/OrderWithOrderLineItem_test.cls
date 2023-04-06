@istest
public class OrderWithOrderLineItem_test {
    Public static testmethod void OrderWithOrderLineItem(){
        
        Account acc = new Account();
        acc.Name = 'Navyasri';
        insert acc;
        
        Product2 Pro = new Product2();
        Pro.Name = 'Sample Product';
        Pro.IsActive=True;
        insert Pro;
        
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice.Pricebook2Id = pricebookId;
        standardPrice.Product2Id = pro.Id;
        standardPrice.UnitPrice = 2000;
        standardPrice.IsActive = true;
        insert standardPrice;
        
       
        List <Opportunity> oppList = new List <Opportunity>();
        Map<Id,Opportunity> OppMap = new Map<Id,Opportunity>();
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Testopportunity';
        opp.AccountId = acc.Id;
        opp.StageName = 'Needs Analysis';
        opp.Pricebook2Id = pricebookId;
        opp.CloseDate = system.today();
        oppList.add(opp);
        insert oppList;
        
        OpportunityLineItem OLI = new OpportunityLineItem();
        OLI.OpportunityId = opp.Id;
        OLI.PricebookEntryId = standardPrice.Id;
        OLI.Product2Id = pro.Id;
        OLI.UnitPrice = 2000 ;
        OLI.Quantity = 2;
        // total price=4000
        insert OLI;
        
        
        Opp.StageName='Closed Won';
        oppmap.put(opp.Id, opp);
        update opp;
        
        
        Test.startTest();
        CreateOrderWithOrderLineItem.OrderWithOrderLineItem(oppList,oppmap);
        Test.stopTest();
    }
}