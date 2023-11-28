package demos;

import java.sql.*;
import java.util.Stack;

public class DBCode {
    String url = "jdbc:mysql://localhost:3308/jsp_database";
    String user = "root";
    String pass = "";    
    private  Connection con;
    public DBCode() {
        try {
           // System.out.println("Attempting to load JDBC driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            //System.out.println("Driver loaded successfully. Attempting to connect to database...");
            con = DriverManager.getConnection(url, user, pass);
            //System.out.println("Database connected!");
        } catch (SQLException e) {
            System.err.println("Error connecting to the database. Check connection parameters.");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found.");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int insert(String sname, String smail, int sage, String sgender, String slocation, String scourses) {
        int res = 0;
        String q = "insert into Student(sname,smail,sage,sgender,slocation,scourses) values(?,?,?,?,?,?)";
        try (PreparedStatement pst = con.prepareStatement(q)) {
            pst.setString(1, sname);
            pst.setString(2, smail);
            pst.setInt(3, sage);
            pst.setString(4, sgender);
            pst.setString(5, slocation);
            pst.setString(6, scourses);
            res = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public Stack<Student> select() {
        Stack<Student> st = new Stack<>();
        String q = "select * from Student";
        try (PreparedStatement pst = con.prepareStatement(q);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                int sid = rs.getInt("sid");
                String sname = rs.getString("sname");
                String smail = rs.getString("smail");
                int sage = rs.getInt("sage");
                String sgender = rs.getString("sgender");
                String slocation = rs.getString("slocation");
                String scourses = rs.getString("scourses");
                String branch = rs.getString("branch");
                Student s = new Student(sid, sname, smail, sage, sgender, slocation, scourses, branch);
                st.push(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return st;
    }

    public int delete(int sid) {
        int res = 0;
        String q = "delete from Student where sid=?";
        try (PreparedStatement pst = con.prepareStatement(q)) {
            pst.setInt(1, sid);
            res = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public Student selectSingle(int sid) {
        Student student = null;
        try {
            String q = "select * from Student where sid=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, sid);
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                String sname = rs.getString("sname");
                String smail = rs.getString("smail");
                int sage = rs.getInt("sage");
                String sgender = rs.getString("sgender");
                String slocation = rs.getString("slocation");
                String scourses = rs.getString("scourses");
                String branch = rs.getString("branch");

                student = new Student(sid, sname, smail, sage, sgender, slocation, scourses, branch);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    public int update(Student student) {
        int res = 0;
        try {
            String q = "update Student set sname=?, smail=?, sage=?, sgender=?, slocation=?, scourses=?, branch=? where sid=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, student.getSname());
            pst.setString(2, student.getSmail());
            pst.setInt(3, student.getSage());
            pst.setString(4, student.getSgender());
            pst.setString(5, student.getSlocation());
            pst.setString(6, student.getScourses());
            pst.setString(7, student.getBranch());
            pst.setInt(8, student.getSid());

            res = pst.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return res;
    }
}
