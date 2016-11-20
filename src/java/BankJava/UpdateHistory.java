/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BankJava;
import java.sql.*;

import BankJava.GetCon;
import BankJava.GetCon;
/**
 *
 * @author Vinod Subbanna
 */
public class UpdateHistory {
 static int status=0;
    public static int histupdate(int accountno,String username,double amount) throws SQLException
    {
        Connection con=GetCon.getCon();
	PreparedStatement ps;
        String withdraw = "Withdrawn";
        
        try{
            ps = con.prepareStatement("INSERT INTO ACCOUNTHISTORY VALUES(?,?,?,?,)");
               ps.setDouble(1,accountno);
                                    ps.setString(2, username);
                                    ps.setString(3, withdraw);
                                    ps.setDouble(4, amount);
                                    status = ps.executeUpdate();
                                    
                                    System.out.println(accountno);
                                    System.out.println(username);
                                    System.out.println(amount);
                                    
                                    
                                    
        } catch (SQLException e) {
		
		e.printStackTrace();
	}
        return status;
    }
}
