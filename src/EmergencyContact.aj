import java.util.ArrayList;

import handlers.contacts.ContactHandler;
import handlers.contacts.Contact;
import ui.input.Input;
import ui.output.Output;
import helpers.MenuChoice;
import i18n.I18N;
import i18n.Messages;

public aspect EmergencyContact {

	pointcut addEmergencyContactOption(ArrayList<MenuChoice> choices):
		execution(void Input.renderMenu(ArrayList<MenuChoice>)) && args(choices);

	void around(ArrayList<MenuChoice> choices): addEmergencyContactOption(choices) {
		ArrayList<MenuChoice> newChoices = new ArrayList<MenuChoice>();
		for (MenuChoice c: choices) {
			newChoices.add(c);
		}
		String message = I18N.getString(Messages.SET_EMERGENCY_CONTACT);
		Runnable task = new Runnable() {
			@Override
			public void run() {
				String name = "ABC";
				String phoneNumber = "912345678";
				Output.getInstance().showMessage(I18N.getString(Messages.SETTING_EMERGENCY_CONTACT, name, phoneNumber));
				ContactHandler.getInstance().getContacts().setEmergencyContact(new Contact(name, phoneNumber));
			}
		};
		MenuChoice choice = new MenuChoice(message, task);
		newChoices.add(choice);
		proceed(newChoices);
	}

}
