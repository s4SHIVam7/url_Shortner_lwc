public class urlShort {
    private static final String URL_API ='https://api.shrtco.de/v2/shorten?url='; 
    @AuraEnabled(cacheable=false)
    public static List<String> urlCall(string query){
        
        //We created/instantiated a HTTP Object
        Http http = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL_API+query);
        req.setMethod('GET');
        
        HTTPResponse res = http.send(req);
        system.debug('Result from the API: '+res);
        
        //Parsing the data from response (JSON to Apex specific format )
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        System.debug('deserializeUntyped: '+m);
        
		Map<String, Object> firstMap = (Map<String, Object>)m.get('result');
		System.debug('Content from the result: '+firstMap);
        String[] emp = new String[]{'Empty'};
       	String[] url = new String[3];
        
        url[0] = String.valueof(firstMap.get('full_short_link'));
		url[1] = String.valueof(firstMap.get('full_short_link2'));
        url[2] = String.valueof(firstMap.get('full_short_link3'));
        
        if(!url.isEmpty()){
            System.debug('URLS :'+url);
            return url;
        } else {
            return emp;
        }
         
    }
    
}