package com.example.jdbc.service;


import com.example.jdbc.domain.Zespol;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ZespolManager {



    private Connection connection;
 //   private String url = "jdbc:jtds:sqlserver://eos.inf.ug.edu.pl;" + "databaseName=kliwinski" + ";user=kliwinski" + ";password=224657";
    private String url = "jdbc:jtds:sqlserver://eos.inf.ug.edu.pl;" + "databaseName=kliwinski" + ";user=kliwinski" + ";password=224657";
    private String createTableKlub = "CREATE TABLE [zespol] (\n" +
            "  [zespol_id] INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,\n" +
            "  [zespol_nazwa_zespolu] VARCHAR(50) NOT NULL,\n" +
            "  [zespol_kraj] VARCHAR(30) NOT NULL\n" +
            ")";



    private PreparedStatement addZespolStmt;
    private PreparedStatement getAllZespolsStmt;
    private PreparedStatement getZespolByIdStmt;
    private PreparedStatement getZespolByNazwaStmt;
    private PreparedStatement getZespolByKrajStmt;
    private PreparedStatement deleteZespolStmt;
    private PreparedStatement deleteAllZespolsStmt;
    private PreparedStatement updateZespolStmt;



    private Statement statement;


    public ZespolManager(){

        try {
            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();

            ResultSet rs = connection.getMetaData().getTables(null, null, null, null);
            boolean tableExists = false;
            while (rs.next()){
                if ("zespol".equalsIgnoreCase(rs.getString("TABLE_NAME"))) {
                    tableExists  = true;
                    break;
                }
            }
            if (!tableExists)
                statement.executeUpdate(createTableKlub);

            addZespolStmt = connection.prepareStatement("INSERT INTO zespol (zespol_nazwa_zespolu, zespol_kraj) VALUES (?, ?)");
            getAllZespolsStmt = connection.prepareStatement("SELECT zespol_id, zespol_nazwa_zespolu, zespol_kraj FROM zespol");
            getZespolByIdStmt = connection.prepareStatement("SELECT * FROM zespol WHERE zespol_id = ?");
            getZespolByNazwaStmt = connection.prepareStatement("SELECT * FROM zespol WHERE zespol_nazwa_zespolu = ?");
            getZespolByKrajStmt = connection.prepareStatement("SELECT * FROM zespol WHERE zespol_kraj = ?");
            deleteZespolStmt = connection.prepareStatement("DELETE FROM zespol WHERE zespol_id = ?");
            deleteAllZespolsStmt = connection.prepareStatement("DELETE FROM zespol");
            updateZespolStmt = connection.prepareStatement("UPDATE zespol SET zespol_nazwa_zespolu = ?, zespol_kraj = ? WHERE zespol_id = ?");




        }

        catch (SQLException e) {
            e.printStackTrace();
        }}

    public Connection getConnection(){
        return connection;
    }


    public int addZespol (Zespol zespol) {
        int count = 0;
        try {
            addZespolStmt.setString(1, zespol.getNazwa());
            addZespolStmt.setString(2, zespol.getKraj());

            count = addZespolStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Zespol> getAllZespols(){
        List<Zespol> zespol = new ArrayList<Zespol>();

        ResultSet rs = null;
        try {
            rs = getAllZespolsStmt.executeQuery();

            while (rs.next()) {
                Zespol z = new Zespol();
                z.setID(rs.getInt("zespol_id"));
                z.setNazwa(rs.getString("zespol_nazwa_zespolu"));
                z.setKraj(rs.getString("zespol_kraj"));
                zespol.add(z);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return zespol;
    }

    public Zespol getZespolById (Zespol zespol) {

        try {
            getZespolByIdStmt.setInt(1, zespol.getID());
            ResultSet rs = getZespolByIdStmt.executeQuery();

            while (rs.next()){
                zespol = new Zespol(rs.getString("zespol_nazwa_zespolu"), rs.getString("zespol_kraj"));
                zespol.setID(rs.getInt("zespol_id"));
                return zespol;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Zespol> getZespolByNazwa (Zespol zespol) {
        List<Zespol> zespoly = new ArrayList<Zespol>();

        try {
            getZespolByNazwaStmt.setString(1, zespol.getNazwa());
            ResultSet rs = getZespolByNazwaStmt.executeQuery();
            while (rs.next()) {
                Zespol z = new Zespol();
                z.setID(rs.getInt("zespol_id"));
                z.setNazwa(rs.getString("zespol_nazwa_zespolu"));
                z.setKraj(rs.getString("zespol_kraj"));
                zespoly.add(z);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return zespoly;
    }

    public List<Zespol> getZespolByKraj (Zespol zespol) {
        List<Zespol> zespoly = new ArrayList<Zespol>();

        try {
            getZespolByKrajStmt.setString(1, zespol.getKraj());
            ResultSet rs = getZespolByKrajStmt.executeQuery();
            while (rs.next()) {
                Zespol z = new Zespol();
                z.setID(rs.getInt("zespol_id"));
                z.setNazwa(rs.getString("zespol_nazwa_zespolu"));
                z.setKraj(rs.getString("zespol_kraj"));
                zespoly.add(z);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return zespoly;
    }

    public int deleteZespol (Zespol zespol) {
        int count = 0;
        try {

            deleteZespolStmt.setInt(1, zespol.getID());
            count = addZespolStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

   public void clearZespols() {
        try {
            deleteAllZespolsStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int updateZespol (Zespol zespol) {
        int count = 0;
        try {
            updateZespolStmt.setString(1, zespol.getNazwa());
            updateZespolStmt.setString(2, zespol.getKraj());
            updateZespolStmt.setInt(3, zespol.getID());

            count = updateZespolStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

}
