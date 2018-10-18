package mvc.model;
import java.sql.*;
import java.util.*;

public class NotasDAO {
	private Connection connection = null;
	public NotasDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost/teepo","root", "Certezajorge123");
		} catch (SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	
	public void adicionaNota(Nota nota, Integer id_categoria) {
		try {
			String sql = "INSERT INTO notas (conteudo,idCategoria) values(?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1,nota.getConteudo());
			stmt.setInt(2, id_categoria);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public List<Nota> getNotas() {
		List<Nota> Notas = new ArrayList<Nota>();
		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM notas");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Nota nota = new Nota();
				nota.setIdNota(rs.getInt("idNota"));
				nota.setIdCategoria(rs.getInt("idCategoria"));
				nota.setConteudo(rs.getString("conteudo"));
				nota.setDataCriacao(rs.getTimestamp("data_criacao"));
				nota.setDataUpdate(rs.getTimestamp("data_update"));
				Notas.add(nota);
			}
			rs.close();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
		return Notas;
	}
	
	public void removeNota(Integer idNota) {
		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM notas WHERE idNota=?");
			stmt.setLong(1, idNota);
			stmt.execute();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
	}
	
	public void removeTodasNotas(Integer idCategoria) {
		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM notas WHERE idCategoria=?");
			stmt.setLong(1, idCategoria);
			stmt.execute();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
	}
	
	public List<Nota> notasCategoria(Categoria categoria){
		List<Nota> Notas = new ArrayList<Nota>();
		Integer id_categ = categoria.getIdCategoria();
		PreparedStatement stmt;
		try {
			stmt = connection.
					prepareStatement("SELECT * FROM notas WHERE idCategoria="+ id_categ);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Nota nota = new Nota();
				nota.setIdNota(rs.getInt("idNota"));
				nota.setIdCategoria(rs.getInt("idCategoria"));
				nota.setConteudo(rs.getString("conteudo"));	
				nota.setDataCriacao(rs.getTimestamp("data_criacao"));
				nota.setDataUpdate(rs.getTimestamp("data_update"));
				
				Notas.add(nota);
				}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			}
		return Notas;
		}	
	
	public void alteraNota(Nota nota) {
		try {
			String sql = "UPDATE notas SET conteudo=? WHERE idNota=? AND idCategoria=?";
			PreparedStatement stmt =
					connection.prepareStatement(sql);
			stmt.setString(1, nota.getConteudo());
			stmt.setInt(2, nota.getIdNota());
			stmt.setInt(3, nota.getIdCategoria());
			stmt.executeUpdate();
			stmt.close();
		} catch(SQLException e) {System.out.println(e);}
	}
	
	public List<Nota> procuraNota(String busca){          			    
		PreparedStatement stmt;
		List<Nota> buscaNota = new ArrayList<Nota>();
		try {
			stmt = connection.prepareStatement("SELECT * FROM notas WHERE conteudo LIKE '%\"+busca+\"%'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Nota nota = new Nota();
				nota.setConteudo(rs.getString("conteudo"));
				nota.setIdCategoria(rs.getInt("idCategoria"));
				nota.setIdNota(rs.getInt("idNota"));
				buscaNota.add(nota);
				}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buscaNota;	
	}
	
	public void close() {
		try { connection.close();}
		catch (SQLException e) {e.printStackTrace();}
	}
}
