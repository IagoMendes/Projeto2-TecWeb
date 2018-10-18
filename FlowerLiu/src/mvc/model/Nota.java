package mvc.model;

import java.sql.Timestamp;

public class Nota {
	private Integer idNota;
	private Integer idCategoria;
	private String conteudo;
	private String cor;
	private Timestamp data_criacao;
	private Timestamp data_update;
	
	public Integer getIdNota() {
		return idNota;
	}
	public void setIdNota(Integer idNota) {
		this.idNota = idNota;
	}
	public Integer getIdCategoria() {
		return idCategoria;
	}
	public void setIdCategoria(Integer idCategoria) {
		this.idCategoria = idCategoria;
	}
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public Timestamp getDataCriacao() {
		return data_criacao;
	}
	public void setDataCriacao(Timestamp data) {
		this.data_criacao = data;
	}
	public Timestamp getDataUpdate() {
		return data_update;
	}
	public void setDataUpdate(Timestamp data) {
		this.data_update = data;
	}
}
