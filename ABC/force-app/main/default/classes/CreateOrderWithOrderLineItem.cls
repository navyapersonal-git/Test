public class CreateOrderWithOrderLineItem {
    Public static void OrderWithOrderLineItem(List<Opportunity> OppRec , Map <Id, Opportunity>OldMap){
     
        List<Order> newOrders = new List<Order>();
        List<OrderItem> newOrderLineItems =new List<OrderItem>();
        Set<Id> OppIds = new Set<Id>();
        Map<Id,Id>OppIdWithOrderId =new Map<Id,Id>();
        
        for(Opportunity opp : OppRec){
            if(opp.StageName == 'Closed Won' && oldMap.get(opp.Id).StageName!='Closed Won' && Opp.HasOpportunityLineItem == True) {
                Order newOrder = new Order();
                newOrder.OpportunityId = opp.Id;
                newOrder.AccountId = opp.AccountId;
                newOrder.EffectiveDate = opp.CloseDate;
                newOrder.Status = 'Draft';
                newOrder.Pricebook2Id = opp.Pricebook2Id;
                OppIds.add(opp.Id);
                newOrders.add(newOrder);
                
              }
    }
       if(newOrders.size()>0)
        insert newOrders; 
        
        
        List<OpportunityLineItem> OppLineItems = [Select Id,OpportunityId,PricebookEntryId, Product2ID, Quantity,UnitPrice,ListPrice From OpportunityLineItem where OpportunityId =:OppIds];
        List<Order> OrderWithOpportunity = [Select Id,OpportunityId,Status,TotalAmount From Order where OpportunityId = :OppIds];
        
        
        for(Order newOr:OrderWithOpportunity){
            OppIdWithOrderId.put(newOr.OpportunityId ,newOr.Id);
            
        }
        
        for(OpportunityLineItem OppProducts: OppLineItems)
        {
            if(OppIdWithOrderId != null && OppIdWithOrderId.containskey(OppProducts.OpportunityId)){
                OrderItem OrderLineItem = new OrderItem();
                OrderLineItem.OrderId = OppIdWithOrderId.get(OppProducts.OpportunityId);
                OrderLineItem.Product2Id = OppProducts.Product2Id;
                OrderLineItem.Quantity = OppProducts.Quantity;
                OrderLineItem.PricebookEntryId = OppProducts.PricebookEntryId;
                OrderLineItem.ListPrice = OppProducts.ListPrice;
                OrderLineItem.UnitPrice = OppProducts.UnitPrice;
                
                newOrderLineItems.add(OrderLineItem);
                
            }
        }
        if(newOrderLineItems.size()>0)
           insert newOrderLineItems;
            }  
}