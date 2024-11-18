package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Database.DBConnect;
import Interfaces.Contacts; // Updated to use the Contacts interface
import Model.Contact; // Updated to use the Contact model

public class ContactService implements Contacts {

    @Override
    public int addContact(Contact contact) {
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();

            preparedStatement = connection.prepareStatement("INSERT INTO contactus (name, email, message, date) VALUES (?, ?, ?, ?)");
            preparedStatement.setString(1, contact.getName());
            preparedStatement.setString(2, contact.getEmail());
            preparedStatement.setString(3, contact.getMessage());
            preparedStatement.setDate(4, new java.sql.Date(contact.getDate().getTime())); 
            preparedStatement.execute();
            preparedStatement.close();
            connection.close();

            return 1;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    @Override
    public ArrayList<Contact> getContacts() {
        ArrayList<Contact> contactList = new ArrayList<>();
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();
            preparedStatement = connection.prepareStatement("SELECT * FROM contactus");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Contact contact = new Contact();

                contact.setId(resultSet.getInt("id"));
                contact.setName(resultSet.getString("name"));
                contact.setEmail(resultSet.getString("email"));
                contact.setMessage(resultSet.getString("message"));
                contact.setDate(resultSet.getDate("date")); 

                contactList.add(contact);
            }

            preparedStatement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }

        return contactList;
    }

    @Override
    public int editContact(Contact contact) {
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();

            // Update value in the contactus table
            preparedStatement = connection.prepareStatement("UPDATE contactus SET name=?, email=?, message=?, date=? WHERE id=?");
            preparedStatement.setString(1, contact.getName());
            preparedStatement.setString(2, contact.getEmail());
            preparedStatement.setString(3, contact.getMessage());
            preparedStatement.setDate(4, new java.sql.Date(contact.getDate().getTime())); // Convert Date to SQL Date
            preparedStatement.setInt(5, contact.getId());
            preparedStatement.execute();
            preparedStatement.close();
            connection.close();
            return 1;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    @Override
    public int deleteContact(int contactId) {
        Connection connection;
        PreparedStatement preparedStatement;

        try {
            connection = DBConnect.getDBConnection();

            // Delete contact from contactus table
            preparedStatement = connection.prepareStatement("DELETE FROM contactus WHERE id=?");
            preparedStatement.setInt(1, contactId);
            preparedStatement.execute();

            return 1;

        } catch (ClassNotFoundException | SQLException e) {
            return 0;
        }
    }

    @Override
    public Contact getContact(int id) {
        Connection connection;
        PreparedStatement preparedStatement;
        Contact contact = new Contact();

        try {
            connection = DBConnect.getDBConnection();

            preparedStatement = connection.prepareStatement("SELECT * FROM contactus WHERE id=?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                contact.setId(resultSet.getInt("id"));
                contact.setName(resultSet.getString("name"));
                contact.setEmail(resultSet.getString("email"));
                contact.setMessage(resultSet.getString("message"));
                contact.setDate(resultSet.getDate("date")); 
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return contact;
    }
}
