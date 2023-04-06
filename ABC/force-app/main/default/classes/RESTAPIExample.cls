public class RESTAPIExample {
    public static void makeAPICall() {
        String username = 'partha';
        String password = 'etg1234$';
        String apiEndpoint = 'https://api.dclcorp.com/api/v1/items?page_size=2';

        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiEndpoint);
        request.setMethod('GET');

        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            system.debug(responseBody);
            // Parse the response as JSON or XML
        } else {
            System.debug('Error: ' + response.getStatusCode());
        }
    }
}