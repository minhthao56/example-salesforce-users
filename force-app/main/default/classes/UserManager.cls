global with sharing class UserManager {
    public UserManager() {
    }
    // public static String Create(String name, String email){
    //     try {
    //         if (email == null || email == '') {
    //             throw new AuraHandledException('Email is required');
    //         }
    //         Users__c  u = new Users__c();
    //         u.name__c = name;
    //         u.email__c = email;
    //         insert u;
    //         return u.Id;
    //     } catch (Exception err) {
    //         return err.getMessage();
    //     }
    // }
    @AuraEnabled(cacheable=true)
    public static  List<Users__c> GetAll() {
        try {
            List<Users__c> userList = [SELECT Id, name__c, email__c FROM Users__c];
            return userList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}