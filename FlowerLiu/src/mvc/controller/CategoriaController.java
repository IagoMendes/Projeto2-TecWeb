package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mvc.model.Categoria;
import mvc.model.CategoriasDAO;

@Controller
public class CategoriaController {
	
	@RequestMapping("/")
	 public String execute() {
		System.out.println("Inicio");
		return "info";
	 }
	@RequestMapping(value = "/categoria")
	 public String form() {
		return "formTarefa";
	 }
	@RequestMapping(value = "/categoria/adicionar", method=RequestMethod.POST)
	 public String adiciona(Categoria categoria) {
		CategoriasDAO dao = new CategoriasDAO();
		dao.adicionaCategoria(categoria);
		return "info";
	}
}
