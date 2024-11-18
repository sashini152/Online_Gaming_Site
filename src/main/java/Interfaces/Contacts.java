package Interfaces;

import java.util.ArrayList;

import Model.Contact;

public interface Contacts {

    public int addContact(Contact c);

    public int editContact(Contact c);

    public Contact getContact(int c);

    public int deleteContact(int c);

    public ArrayList<Contact> getContacts();
}