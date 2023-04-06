public class OCI {
    public static void makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.dclcorp.com/api/v1/items');
        request.setMethod('GET');
        request.setHeader('Content-Type','application/text'); 
        
        String username = 'partha';
        String password = 'etg1234$';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);
    
        HttpResponse response = http.send(request);
        
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
              System.debug(response.getBody());
        }
        
    }
   
}