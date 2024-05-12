//Chat_SSMarketVO.java

package JangSunWoong;
import java.util.*;
import java.sql.Date;
import java.sql.Timestamp;

public class Chat_SSMarketVO
{
	private String nickname;
	private String nickname2;
	private String mymessage;
	private Timestamp mytime;
	
	public String getNickname() 
	{
		return nickname;
	}

	public void setNickname(String nickname) 
	{
		this.nickname = nickname;
	}

	public String getNickname2() 
	{
		return nickname2;
	}

	public void setNickname2(String nickname2)
	{
		this.nickname2 = nickname2;
	}

	public String getMymessage() 
	{
		return mymessage;
	}

	public void setMymessage(String mymessage) 
	{
		this.mymessage = mymessage;
	}

	public Timestamp getMytime() 
	{
		return mytime;
	}

	public void setMytime(Timestamp mytime) 
	{
		this.mytime = mytime;
	}
	
	
	public Chat_SSMarketVO(String nickname, String nickname2, String mymessage)
	{
		this.nickname = nickname;
		this.nickname2 = nickname2;
		this.mymessage = mymessage;
	}

	public Chat_SSMarketVO(String nickname, String nickname2, String mymessage, Timestamp mytime)
	{
		this.nickname = nickname;
		this.nickname2 = nickname2;
		this.mymessage = mymessage;
		this.mytime = mytime;
	}
	
	public Chat_SSMarketVO(String nickname, String nickname2, Timestamp mytime) {
		this.nickname = nickname;
		this.nickname2 = nickname2;
		this.mytime = mytime;
	}

	public Chat_SSMarketVO() 
	{
		
	}
	
	public static void main(String[] args) 
	{

	}

}
