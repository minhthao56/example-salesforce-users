trigger chats on Users__c (after insert) {
    Chats__c newChat = new Chats__c();
    newChat.chat_name__c = 'Chat trigger 01';
    insert newChat;
}