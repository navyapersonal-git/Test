public class IndustryBasedOnRating {
    Public static void AccountDetails(List<Account> AccRec , Map <Id, Account>OldMap){
        for(Account acc : AccRec){
            if(acc.Rating == OldMap.get(acc.Id).Rating){
                continue;
            }
            Map<String, String> RatingToIndustry = new Map<string,string>{
                'Hot' => 'Agriculture',
                'Warm' => 'Consulting',
                'Cold' => 'Electronics'   
            };
                acc.Industry = RatingToIndustry.get(acc.Rating);
        }
       
    }
}