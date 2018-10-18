package mvc.model;
import java.sql.*;
import java.util.*;

public class TarefasDAO {
	private Connection connection = null;
	public TarefasDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost/teepo","root", "Certezajorge123");
		} catch (SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	
	public void adicionaCategoria(Categoria categoria) {
		try {
			System.out.println(categoria.getTitulo());
			String sql = "INSERT INTO categorias (titulo) values(?)";
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1,categoria.getTitulo());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public List<Categoria> getCategorias() {
		List<Categoria> Categorias= new ArrayList<Categoria>();
		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM categorias");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Categoria categ = new Categoria();
				categ.setIdCategoria(rs.getInt("idCategoria"));
				categ.setTitulo(rs.getString("titulo"));
				Categorias.add(categ);
			}
			rs.close();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
		return Categorias;
	}
	
	public void removeCategoria(Integer Id) {
		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM categorias WHERE idCategoria=?");
			stmt.setLong(1, Id);
			stmt.execute();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
	}
	
	public Categoria getCategoriaFromId(Integer Id) {
		Categoria categoria = new Categoria();
		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM categorias WHERE idCategoria=?");
			stmt.setLong(1, Id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				categoria.setIdCategoria(rs.getInt("idCategoria"));
				categoria.setTitulo(rs.getString("titulo"));
			}
			rs.close();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
		return categoria;
	}
	
	public void alteraCategoria(Categoria categoria) {
		try {
			String sql = "UPDATE categorias SET titulo=? WHERE idCategoria=?";
			PreparedStatement stmt =
					connection.prepareStatement(sql);
			stmt.setString(1, categoria.getTitulo());
			stmt.setInt(2, categoria.getIdCategoria());
			stmt.executeUpdate();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
	}
	
	public void finaliza(Long id) {
		try {
			String sql = "UPDATE tarefa SET finalizado=?, dataFinalizacao=? " + "WHERE id=?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setBoolean(1, true);
			stmt.setDate(2, new Date(Calendar.getInstance().getTimeInMillis()));
			stmt.setLong(3, id);
			stmt.executeUpdate();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
	}
	
	public void close() {
		try { connection.close();}
		catch (SQLException e) {e.printStackTrace();}
	}
}
