package mvc.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping("/home")
	 public String home(HttpServletRequest request, HttpServletResponse response) {
		return "home";
	}
	@RequestMapping(value = "/criaCategoria", method = RequestMethod.POST)
	 public String criaCategoria(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("CRIO");
		CategoriasDAO dao = new CategoriasDAO();
		Categoria categoria = new Categoria();
		categoria.setTitulo(request.getParameter("tituloCategoria"));
		dao.adicionaCategoria(categoria);
		dao.close();
		return "home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.DELETE)
	@ResponseBody
	 public String deletaCategoria(@RequestBody String rawJson) {
		System.out.println("DELETO");
		JSONObject parsedJson = new JSONObject(rawJson);
		System.out.println(parsedJson.getString("idCategoria"));
		Integer idCategoria = Integer.parseInt(parsedJson.getString("idCategoria"));
		CategoriasDAO dao = new CategoriasDAO();
		dao.removeCategoria(idCategoria);
		dao.removeTodasNotas(idCategoria);
		dao.close();
		return "home";
		
	}
//	@RequestMapping(value = "/editaCategoria", method = RequestMethod.POST)
//	@ResponseBody
//	 public String nodale() {
//		System.out.println("EDITO");
//		return "editaCategoria";
//	}
	@RequestMapping(value = "/home", method = RequestMethod.PUT)
	@ResponseBody
	 public String editaCategoria(@RequestBody String rawJson) {
		System.out.println("EDITO");
		JSONObject parsedJson = new JSONObject(rawJson);
		Integer idCategoria = Integer.parseInt(parsedJson.getString("idCategoria"));
		CategoriasDAO dao = new CategoriasDAO();
		Categoria categoria = new Categoria();
		//System.out.println(idCategoria);
		//System.out.println(parsedJson.getString("tituloCategoria"));
		categoria.setIdCategoria(idCategoria);
		categoria.setTitulo(parsedJson.getString("tituloCategoria"));
		dao.alteraCategoria(categoria);
		dao.close();
		return "home";
	}
	@RequestMapping(value = "/criaNota", method = RequestMethod.POST)
	 public String criaNota(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("CRIO NOTA");
		Integer idCategoria = Integer.parseInt(request.getParameter("IdCategoria"));
		NotasDAO dao = new NotasDAO();		 
		Nota nota = new Nota();
		nota.setConteudo(request.getParameter("conteudoNota"));
		nota.setIdCategoria(idCategoria);
		dao.adicionaNota(nota, idCategoria);
		dao.close();
		return "home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	@ResponseBody
	 public String deletaNota(
			 @RequestBody String rawJson,
			 HttpServletRequest request, 
			 HttpServletResponse response) {
		System.out.println("DELETO NOTA");
		JSONObject parsedJson = new JSONObject(rawJson);
		System.out.println(parsedJson.getString("idNota"));
		Integer idCateg = Integer.parseInt(parsedJson.getString("idCategoria"));
		Integer idNota = Integer.parseInt(parsedJson.getString("idNota"));
		NotasDAO dao = new NotasDAO();
		dao.removeNota(idNota);
		dao.close();
		request.setAttribute("IdCategoria", idCateg);
		return "home";
		
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
