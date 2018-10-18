package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.model.Categoria;
import mvc.model.TarefasDAO;

@Controller
public class TarefasController {
	
	@RequestMapping("/")
	 public String execute() {
		System.out.println("Lógica do MVC");
		return "info";
	 }
	@RequestMapping("criaCategoria")
	 public String form() {
		return "formTarefa";
	 }
	@RequestMapping("adicionaCategoria")
	 public String adiciona(@RequestParam(value="titulo", defaultValue="Categoria") Categoria categoria) {
		TarefasDAO dao = new TarefasDAO();
		System.out.println("Criou objeto dao");
		dao.adicionaCategoria(categoria);
		return "home";
	}
	@RequestMapping("editaCategoria")
	 public String edita(Categoria categoria) {
		return
	}
}
