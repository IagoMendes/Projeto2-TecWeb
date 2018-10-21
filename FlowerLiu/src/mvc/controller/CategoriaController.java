package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.Categoria;
import mvc.model.CategoriasDAO;
import mvc.model.Nota;
import mvc.model.NotasDAO;

@Controller
public class CategoriaController {
	
	@RequestMapping("/")
	 public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Inicio");
		return "index";
	 }	
	
	@RequestMapping(value = "/criaCategoria", method = RequestMethod.POST)
	 public String criaCategoria(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("CRIO");
		CategoriasDAO dao = new CategoriasDAO();
		Categoria categoria = new Categoria();
		categoria.setTitulo(request.getParameter("tituloCategoria"));
		dao.adicionaCategoria(categoria);
		dao.close();
		return "criaCategoria";
	}
	@RequestMapping(value = "/deletaCategoria", method = RequestMethod.DELETE)
	 public void deletaCategoria(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("DELETO");
		Integer idCategoria = Integer.parseInt(request.getParameter("IdCategoria"));
		CategoriasDAO dao = new CategoriasDAO();
		dao.removeCategoria(idCategoria);
		dao.removeTodasNotas(idCategoria);
		dao.close();
	}
	@RequestMapping(value = "/editaCategoria", method = RequestMethod.PUT)
	 public String editaCategoria(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("EDITO");
		Integer idCategoria = Integer.parseInt(request.getParameter("IdCategoria"));
		CategoriasDAO dao = new CategoriasDAO();
		Categoria categoria = new Categoria();
		categoria.setIdCategoria(idCategoria);
		categoria.setTitulo(request.getParameter("TituloCategoria"));
		dao.alteraCategoria(categoria);
		dao.close();
		return "editaCategoria";
	}
	@RequestMapping(value = "/criaNota", method = RequestMethod.POST)
	 public String criaNota(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("CRIO");
		Integer idCategoria = Integer.parseInt(request.getParameter("IdCategoria"));
		NotasDAO dao = new NotasDAO();		 
		Nota nota = new Nota();
		nota.setConteudo(request.getParameter("conteudoNota"));
		nota.setIdCategoria(idCategoria);
		dao.adicionaNota(nota, idCategoria);
		dao.close();
		return "criaNota";
	}
	@RequestMapping(value = "/deletaNota", method = RequestMethod.DELETE)
	 public void deletaNota(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("DELETO");
		Integer idCateg = Integer.parseInt(request.getParameter("IdCategoria"));
		Integer idNota = Integer.parseInt(request.getParameter("IdNota"));
		NotasDAO dao = new NotasDAO();
		dao.removeNota(idNota);
		dao.close();
		request.setAttribute("IdCategoria", idCateg);
		
	}
	@RequestMapping(value = "/editaNota", method = RequestMethod.PUT)
	 public String editaNota(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("EDITO");
		Integer idCateg = Integer.parseInt(request.getParameter("IdCategoria"));
		Integer idNota = Integer.parseInt(request.getParameter("IdNota"));
		NotasDAO dao = new NotasDAO();
		Nota nota = new Nota();
		nota.setIdNota(idNota);
		nota.setIdCategoria(idCateg);
		nota.setConteudo(request.getParameter("ConteudoNota"));
		dao.alteraNota(nota);
		dao.close();
		request.setAttribute("idCategoria", idCateg);		
		return "editaNota";
	}
	@RequestMapping(value="/procura", method = RequestMethod.GET)
	 public String procura(HttpServletRequest request, HttpServletResponse response){
		return "procura";
	}
}
