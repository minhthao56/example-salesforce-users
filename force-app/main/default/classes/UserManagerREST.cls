@RestResource(urlMapping='/Users__c/*')
global with sharing class UserManagerREST {
    public UserManagerREST() {
    }

    global class RequestBody {
        public String name;
        public String email;
    }

    @HttpPost
    global static String Create(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        RequestBody requestBody = (RequestBody) JSON.deserialize(req.requestBody.toString(), RequestBody.class);
        try {
            Users__c u = new Users__c();
            u.email__c = requestBody.email;
            u.name__c = requestBody.name;
            insert u;
            
            return u.Id;
        } catch (Exception err) {
            return 'email: ' + requestBody.email + 'name: ' + requestBody.name + ' err: ' + err.getMessage();
        }
    }
}