package guest.base;

import guest.base.Action;
import guest.impl.GuestbookList;
import guest.impl.GuestbookWrite;


public class ActionFactory {

	public Action getAction(String command) {
		Action action = null;
		
		switch(command) {
		case "GUESTBOOKWRITE" : action = new GuestbookWrite();
			break;
		case "GUESTBOOKLIST": action = new GuestbookList();
		break;
		
		}
		
		return action;
	}
}
