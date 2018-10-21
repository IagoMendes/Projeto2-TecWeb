package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.model.Tarefa;
import mvc.model.TarefasDAO;

@Controller
public class TarefasController {
	
	@RequestMapping("/")
	 public String execute() {
		System.out.println("Lógica do MVC");
		return "info";
	 }
	@RequestMapping("criaTarefa")
	 public String form() {
		return "formTarefa";
	 }
	@RequestMapping("adicionaTarefa")
	 public String adiciona(Tarefa tarefa) {
		TarefasDAO dao = new TarefasDAO();
		System.out.println("Criou objeto dao");
		dao.adicionaDescricao(tarefa);
		return "adicionada PORRRA CAARALHO";
	}
}
