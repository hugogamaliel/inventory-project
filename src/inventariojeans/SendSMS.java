package inventariojeans;

import com.twilio.Twilio; 
import com.twilio.rest.api.v2010.account.Message; 
import com.twilio.rest.api.v2010.account.MessageCreator; 
import com.twilio.type.PhoneNumber; 

public class SendSMS {

	private final static String ACCOUNT_SID = "AC37a2d04d0d49dd8a72f61e47dafb5638"; 
    private final static String AUTH_TOKEN = "5c66c6c0a7f7f768db925d09fe7e55b5";
    
	public String sendSMS(String textMsg, String saldo, String phoneNumber)
	{
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN); 
        
		MessageCreator messageCreator = Message.creator( 
	            "AC37a2d04d0d49dd8a72f61e47dafb5638",
	            new PhoneNumber("+52" + phoneNumber), //to
	            new PhoneNumber("+19375193758"), //from
	            textMsg + " Saldo: " + saldo
	        ); 
    
        Message message = messageCreator.create(); 
        System.out.println("Mensaje enviado" + message.getSid()); 
        
        //Ventas.saludo = "hola";
        
		return "";
	}
	
	public String sendSMSToMe(String textMsg, String saldo)
	{
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN); 
        
		MessageCreator messageCreator = Message.creator( 
	            "AC37a2d04d0d49dd8a72f61e47dafb5638",
	            new PhoneNumber("+523316909205"), //to
	            new PhoneNumber("+19375193758"), //from
	            textMsg + " Saldo: " + saldo
	        ); 
    
        Message message = messageCreator.create(); 
        System.out.println("Mensaje enviado" + message.getSid()); 
        
		return "";
	}
}
