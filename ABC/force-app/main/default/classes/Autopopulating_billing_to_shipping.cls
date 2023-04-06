public class Autopopulating_billing_to_shipping {
    Public static void Autopopulate(List <Account> AccRecords){
         List<Account> Acc = new List<Account>();
        
        for(Account Acc1 : AccRecords){
            if(Acc1.BillingAddress != NULL){
            Acc1.ShippingCity = Acc1.BillingCity;
            Acc1.ShippingCountry = Acc1.BillingCountry;
            Acc1.ShippingPostalCode = Acc1.BillingPostalCode;
            Acc1.ShippingState = Acc1.BillingState;
            Acc1.ShippingStreet = Acc1.Billingstreet;
                
        }
          Update Acc1;  
        }
        
    }

}