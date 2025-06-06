﻿using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for MyAdoHelper
/// פעולות עזר לשימוש במסד נתונים  מסוג 
/// SQL SERVER
///  App_Data המסד ממוקם בתקיה 
/// </summary>

public class MyAdoHelper
{
	public MyAdoHelper()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public static SqlConnection ConnectToDb(string fileName)
    {
        string path = HttpContext.Current.Server.MapPath("App_Data/");//מיקום מסד בפורוייקט
        path += fileName;
        //string path = HttpContext.Current.Server.MapPath("App_Data/" + fileName);//מאתר את מיקום מסד הנתונים מהשורש ועד התקייה בה ממוקם המסד
        //string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=" +
        //                     path +
        //                     ";Integrated Security=True;User Instance=True";

        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + path + ";Integrated Security=True;";
        // Changed connString to work for only PizzaMoshiko Database

        // string connString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

        SqlConnection conn = new SqlConnection(connString);
        return conn;

    }

    /// <summary>
    /// To Execute update / insert / delete queries
    ///  הפעולה מקבלת שם קובץ ומשפט לביצוע ומבצעת את הפעולה על המסד
    /// </summary>

    public static void  DoQuery(string fileName, string sql)//הפעולה מקבלת שם מסד נתונים ומחרוזת מחיקה/ הוספה/ עדכון
    //ומבצעת את הפקודה על המסד הפיזי
    {

        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        com.ExecuteNonQuery();
        com.Dispose();
        conn.Close();
      
    }

    public static object GetFieldValue(string fileName, string sql)
    {
        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader reader = com.ExecuteReader();

        if (reader.Read()) // Check if there is at least one row
        {
            // Assuming you want the first field (column) in the row
            object fieldValue = reader.GetValue(0); // 0 represents the first field (column)
            conn.Close();
            return fieldValue;
        }
        else
        {
            conn.Close();
            return null; // No rows found
        }
    }



    /// <summary>
    /// To Execute update / insert / delete queries
    ///  הפעולה מקבלת שם קובץ ומשפט לביצוע ומחזירה את מספר השורות שהושפעו מביצוע הפעולה
    /// </summary>
    public static int RowsAffected(string fileName, string sql)//הפעולה מקבלת מסלול מסד נתונים ופקודת עדכון
    //ומבצעת את הפקודה על המסד הפיזי
    {

        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        int rowsA = com.ExecuteNonQuery();
        conn.Close();
        return rowsA;
    }

    public static int InsertAndGetId(string fileName, string sql)
    {
        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        // Append SELECT SCOPE_IDENTITY() to get the new ID
        SqlCommand com = new SqlCommand(sql + "; SELECT SCOPE_IDENTITY();", conn);
        object result = com.ExecuteScalar();
        conn.Close();
        return Convert.ToInt32(result);
    }


    /// <summary>
    /// הפעולה מקבלת שם קובץ ומשפט לחיפוש ערך - מחזירה אמת אם הערך נמצא ושקר אחרת
    /// </summary>
    public static bool IsExist(string fileName, string sql)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {

        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader data = com.ExecuteReader();
        bool found;
        found=(bool) data.Read();// אם יש נתונים לקריאה יושם אמת אחרת שקר - הערך קיים במסד הנתונים
        conn.Close();
        return found;

    }


    public static DataTable ExecuteDataTable(string fileName, string sql)
    {
        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlDataAdapter tableAdapter = new SqlDataAdapter(sql,conn);
        DataTable dt = new DataTable();
        tableAdapter.Fill(dt);
        return dt;
    }


    public static void ExecuteNonQuery(string fileName, string sql)
    {
        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand command = new SqlCommand(sql, conn);
        command.ExecuteNonQuery();
        conn.Close();
    }

    public static string printDataTable(string fileName, string sql)
    {
        DataTable dt = ExecuteDataTable(fileName, sql);

        if (dt == null || dt.Rows.Count == 0)
        {
            return "No data available.";
        }

        string printStr = "<table border='1'>";

        // Add column headers
        printStr += "<tr>";
        foreach (DataColumn column in dt.Columns)
        {
            printStr += "<th>" + column.ColumnName + "</th>";
        }
        printStr += "</tr>";

        // Add data rows
        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {
                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }

        printStr += "</table>";

        return printStr;
    }

    public static string printUserTable(string fileName, string sql)
    {
        DataTable dt = ExecuteDataTable(fileName, sql);

        if (dt == null || dt.Rows.Count == 0)
        {
            return "No data available.";
        }

        string printStr = "<table border='1'>";

        // Add column headers
        printStr += "<tr>";
        printStr += "<th>Action</th>";
        foreach (DataColumn column in dt.Columns)
        {
            printStr += "<th>" + column.ColumnName + "</th>";
        }
        printStr += "</tr>";

        // Add data rows
        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            int userId = (int)row["id"];
            printStr += "<td><form method='post' action='/'><input type='submit' class='delete' name='deleteacc' value='Delete' />" +
                       "<input type='hidden' name='id' value='" + userId + "' />" +
                      "</form></td>";

            foreach (object myItemArray in row.ItemArray)
            {
                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }

        printStr += "</table>";

        return printStr;
    }

    public static string printOrderTable(string fileName, string sql)
    {
        DataTable dt = ExecuteDataTable(fileName, sql);

        if (dt == null || dt.Rows.Count == 0)
        {
            return "No data available.";
        }

        string[] statusOptions = new string[]
        {
        "pending", "confirmed", "in progress", "ready for pickup", "out for delivery",
        "completed", "canceled", "failed", "delivered"
        };

        string printStr = @"
            <script>
                function updateStatus(orderId, newStatus) {
                    fetch('updateStatus.aspx?id=' + encodeURIComponent(orderId) + '&status=' + encodeURIComponent(newStatus))
                        .then(response => response.text())
                        .then(data => {
                            if (data.trim() !== 'success') {
                                alert('Failed to update status: ' + data);
                            }
                        })
                        .catch(error => {
                            alert('Error: ' + error);
                        });
                }
            </script>";



        printStr += "<table border='1'>";

        // Add column headers
        printStr += "<tr>";
        foreach (DataColumn column in dt.Columns)
        {
            printStr += "<th>" + column.ColumnName + "</th>";
        }
        printStr += "</tr>";

        // Add data rows
        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (DataColumn column in dt.Columns)
            {
                if (column.ColumnName == "Status")
                {
                    string orderId = row["OrderID"].ToString();
                    string currentStatus = row["Status"].ToString();

                    printStr += "<td><select onchange='updateStatus(" + orderId + ", this.value)'>";
                    foreach (string status in statusOptions)
                    {
                        string selected = (status == currentStatus) ? "selected" : "";
                        printStr += "<option value='" + status + "' " + selected + ">" + status + "</option>";
                    }
                    printStr += "</select></td>";
                }
                else
                {
                    printStr += "<td>" + row[column].ToString() + "</td>";
                }
            }
            printStr += "</tr>";
        }

        printStr += "</table>";

        return printStr;
    }

}
