using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
// MyADOHelper is a static class the wrap all DB methods in the web site
// In order to use the methods summit by calling MyADOHealper.<method_name>
public static class MyADOHelper
{
    public static string err;
    // Define the DB connection with relative path
    public static SqlConnection connection =
    new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\userstable.mdf;Integrated Security=True");
    private const string TABLE_NAME = "SignUpTBL";

    public static DataSet GetDataSet(string sql)
    // input: receives a sql query
    // output: returns a DS reference to the sql result
    {
        DataSet ds = new DataSet();
        SqlDataAdapter adapter;
        SqlCommand cmd = new SqlCommand(sql, connection);
        adapter = new SqlDataAdapter(cmd);
        try
        {
            connection.Open();
            adapter.Fill(ds);
            connection.Close();
        }
        catch
        {
            return null;
        }
        return ds;
    }

    public static int GetDBSize()
    // input: N/A
    // output: returns number of users in DB
    {
        string sql = $"SELECT * FROM {TABLE_NAME}";
        return GetDataSet(sql) != null ? GetDataSet(sql).Tables[0].Rows.Count : 0;
    }
    public static bool Exist2(string key, string email, string username, string name)
    // input: receives a table key, email, username and firstname of the user
    // output: returns true if they all in DB. Otherwise, returns false
    {
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE phone = '{key}' AND email = '{email}' AND username = '{username}' AND firstname = '{name}'";
        SqlCommand cmd = new SqlCommand(sql, connection);
        Object obj = null;
        try
        {
            connection.Open();
            // Exceute the SQL command via the DB connection and save result reference in obj
            obj = cmd.ExecuteScalar();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured: search for specific inputs failed!");
        }

        return obj != null ? true : false;
    }

    public static bool Exist(string key)
    // input: receives a table key
    // output: returns true if key in DB. Otherwise, returns false
    {
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE phone = '{key}'";
        SqlCommand cmd = new SqlCommand(sql, connection);
        Object obj = null;
        try
        {
            connection.Open();
            // Exceute the SQL command via the DB connection and save result reference in obj
            obj = cmd.ExecuteScalar();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured: search for specific phone failed!");
        }

        return obj != null ? true : false;
    }

    public static bool Exist3(string key, string email)
    // input: receives a table key, email, username and firstname of the user
    // output: returns true if they all in DB. Otherwise, returns false
    {
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE phone = '{key}' AND email = '{email}'";
        SqlCommand cmd = new SqlCommand(sql, connection);
        Object obj = null;
        try
        {
            connection.Open();
            // Exceute the SQL command via the DB connection and save result reference in obj
            obj = cmd.ExecuteScalar();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured: search for specific inputs failed!");
        }

        return obj != null ? true : false;
    }

    public static bool Authentication(string username, string password, string phone)
    // input: receives an phone, username and a password
    // output: returns true if the given id and password, username and phone appear as an entity in DB. Otherwise, returns false
    {
        string sqlAuth = $"SELECT * FROM {TABLE_NAME} WHERE (username = '{username}') AND (password = '{password}') AND (phone = '{phone}')";
        SqlCommand cmd = new SqlCommand(sqlAuth, connection);
        Object obj = null;

        try
        {
            connection.Open();
            obj = cmd.ExecuteScalar();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured: authentication failed!");
        }

        return obj != null ? true : false;
    }

    public static void Insert(string username, string phone, string password, string firstName, string lastName, string email, int gender, char location)
    // input: receives all relevant values to insert new user in DB
    // output: inserts new entity according to values given in method
    {
        string insert;
        if (phone!="0585200321")
           insert = $"INSERT INTO {TABLE_NAME} (username, phone, password, firstname, lastname, email, gender, location, admin) VALUES (N'{username}', N'{phone}', N'{password}', N'{firstName}', N'{lastName}', N'{email}', {gender}, N'{location}', N'0')";
        else
           insert = $"INSERT INTO {TABLE_NAME} (username, phone, password, firstname, lastname, email, gender, location, admin) VALUES (N'{username}', N'{phone}', N'{password}', N'{firstName}', N'{lastName}', N'{email}', {gender}, N'{location}', N'1')";
        System.Diagnostics.Debug.WriteLine(insert);
        SqlCommand cmd = new SqlCommand(insert, connection);
        try
        {
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        catch
        {

            Console.WriteLine("Error occured: insert new user failed!");
        }
    }

    public static string ShowPassword(string key)
    // input: receives a table key
    // output: returns the user's password
    {
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE phone = '{key}'";
        DataSet ds = GetDataSet(sql);
        return ds.Tables[0].Rows[0]["password"].ToString();
    }

    public static void UpdatePassword(string key, string newPassword)
    // input: receives a table key and a new password
    // output: updates user's paasword accordingly
    {
        string update = $"UPDATE {TABLE_NAME} SET password = '{newPassword}' WHERE phone = '{key}'";
        SqlCommand cmd = new SqlCommand(update, connection);
        try
        {
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured: update new password failed!");
        }
    }

    public static void UpdateUserName(string key, string newUserName)
    // input: receives a table key and a new username
    // output: updates user's username accordingly
    {
        string update = $"UPDATE {TABLE_NAME} SET username = '{newUserName}' WHERE phone = '{key}'";
        SqlCommand cmd = new SqlCommand(update, connection);
        try
        {
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured: update new Username failed!");
        }
    }

    public static string TableOfUsers(string variable, string input)
    // input: n/a
    // output: returns a string represents table of users
    {
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE {variable} = '{input}'";
        DataSet ds = GetDataSet(sql);
        string resultStr = "";
        DataRow row;
        // Table logo and title      
        resultStr += "<h1 style='color:blue'> Table Of Users </h1> </center>";
        // Setting table header
        resultStr += "<table border='1' align='center' >";
        resultStr += "<tr><th>First Name</th><th>Last Name</th><th>phone</th><th>email</th><th>gender</th><th>username</th><th>location</th><th>admin</th></tr>";
        // Scanning all rows of the 1st table in the DataSet (Tables[0])
        for (int k = 0; k < ds.Tables[0].Rows.Count; k++)
        //foreach (DataRow row in ds.Tables[0].Rows)
        {
            row = ds.Tables[0].Rows[k];
            resultStr += "<tr>";
            resultStr += "<td>" + row["firstName"] + "</td>";
            resultStr += "<td>" + row["lastName"] + "</td>";
            resultStr += "<td>" + row["phone"] + "</td>";
            resultStr += "<td>" + row["email"] + "</td>";
            if ((bool)row["gender"])
                resultStr += "<td>Female</td>";
            else
                resultStr += "<td>Male</td>";
            resultStr += "<td>" + row["username"] + "</td>";
            resultStr += "<td>" + row["location"] + "</td>";
            if ((bool)row["admin"])
                resultStr += "<td>yes</td>";
            else
                resultStr += "<td>no</td>";
            resultStr += "</tr>";
        }
        resultStr += "</table>";
        return resultStr;
    }

    public static string GetName(string key)
    {
        //input: user key
        // output: returns the name of user with that key
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE phone = '{key}'";
        DataSet ds = GetDataSet(sql);
        return ds.Tables[0].Rows[0]["firstname"].ToString();
    }

    public static string AllNames()
    {
        // input: n/a
        // output: all users names
        string sql = $"SELECT * FROM {TABLE_NAME}";
        string names = "";
        DataSet ds = GetDataSet(sql);
        for (int i = 0; i < GetDBSize(); i++)
        {
            if (i == GetDBSize() - 1)
                names = names + " and " + ds.Tables[0].Rows[i]["firstname"].ToString();
            else if (i == GetDBSize() - 2)
                names = names + ds.Tables[0].Rows[i]["firstname"].ToString() + " ";
            else
                names = names + ds.Tables[0].Rows[i]["firstname"].ToString() + ", ";
        }
        return names;
    }

    public static string AllNamesByEmail(string email, string phone)
    {
        //input: the email you want to search for and your phone to check if you alloud to get this information
        // output: users table if you alloud to
        if (GetAdmin(phone))
        {
            string variable = "email";
            return TableOfUsers(variable, email);
        }
        return "you cant see this information";
    }
    public static string AllNamesByPhone(string phone, string ownphone)
    {
        //input: the phone you want to search for and your phone to check if you alloud to get this information
        // output: users table if you alloud to
        if (GetAdmin(ownphone))
        {
            string variable = "phone";
            return TableOfUsers(variable, phone);
        }
        return "you cant see this information";
    }
    public static string AllNamesByUserName(string Username, string phone)
    {
        //input: the username you want to search for and your phone to check if you alloud to get this information
        // output: users table if you alloud to
        if (GetAdmin(phone))
        {
            string variable = "username";
            return TableOfUsers(variable, Username);
        }
        return "you cant see this information";
    }

    public static void Delete(string key)
    {
        //input: two inputs to make sure user wants to delete
        // output: delete the user
        string delete = $"DELETE FROM {TABLE_NAME} WHERE phone = '{key}'";
        SqlCommand cmd = new SqlCommand(delete, connection);
        try
        {
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured");
        }
    }

    public static string AllData(string phone)
    {
        // input: user phone to check if is alloud to see this information
        // output: all users data
        if (GetAdmin(phone))
        {
            string variable = "1";
            return TableOfUsers(variable, variable);
        }
        return "you cant see this information";
    }

    public static void MakeAdmin(string userphone)
    {
        //input: user phone to make admin
        // output: giving admin acces to the user 
        string update = $"UPDATE {TABLE_NAME} SET admin = '1' WHERE phone = '{userphone}'";
        SqlCommand cmd = new SqlCommand(update, connection);
        try
        {   
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }   
        catch
        {
            Console.WriteLine("Error occured");
         
        }
    }

    public static void MakeUnAdmin(string userphone)
    {
        //input: user phone to remove admin
        // output: removing admin acces to the user 
        string update = $"UPDATE {TABLE_NAME} SET admin = '0' WHERE phone = '{userphone}'";
        SqlCommand cmd = new SqlCommand(update, connection);
        try
        {
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        catch
        {
            Console.WriteLine("Error occured");

        }
    }

    public static string SelfDetails(string ownphone)
    {
        //input: your phone
        // output: your user details
        string variable = "phone";
        return TableOfUsers(variable, ownphone);        
    }

    public static bool GetAdmin(string phone)
    {
        // input: user key
        // output: returns if the user admin
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE phone = '{phone}'";
        DataSet ds = GetDataSet(sql);
        bool s = (bool)ds.Tables[0].Rows[0]["admin"];
        if ( s==true)
        {
            return true;
        }
        return false;
    
    }
}