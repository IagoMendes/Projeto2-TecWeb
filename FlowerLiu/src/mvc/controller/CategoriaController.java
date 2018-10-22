package mvc.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.Categoria;
import mvc.model.CategoriasDAO;
import mvc.model.Nota;
import mvc.model.NotasDAO;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

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
	@RequestMapping(value = "/categoria", method = RequestMethod.POST)
	 public @ResponseBody String criaCategoria(@RequestBody String rawJson) {
		System.out.println("CRIO");
		JSONObject parsedJson = new JSONObject(rawJson);
		CategoriasDAO dao = new CategoriasDAO();
		Categoria categoria = new Categoria();
		categoria.setTitulo(parsedJson.getString("tituloCategoria"));
		dao.adicionaCategoria(categoria);
		dao.close();
		return "criaCategoria";
	}
	@RequestMapping(value = "/categoria", method = RequestMethod.DELETE)
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
		System.out.println(parsedJson.getString("idCategoria")); 	
		return "home";
		
	}
	@RequestMapping(value = "/categoria", method = RequestMethod.PUT)
	@ResponseBody
	 public String editaCategoria(@RequestBody String rawJson) {
		System.out.println("EDITO");
		JSONObject parsedJson = new JSONObject(rawJson);
		Integer idCategoria = Integer.parseInt(parsedJson.getString("idCategoria"));
		CategoriasDAO dao = new CategoriasDAO();
		Categoria categoria = new Categoria();
		categoria.setIdCategoria(idCategoria);
		categoria.setTitulo(parsedJson.getString("tituloCategoria"));
		dao.alteraCategoria(categoria);
		dao.close();
		return "home";
	}
	@RequestMapping(value = "/nota", method = RequestMethod.POST)
	@ResponseBody
	 public String criaNota(@RequestBody String rawJson) {
		System.out.println("CRIO NOTA");
		JSONObject parsedJson = new JSONObject(rawJson);
		Integer idCategoria = Integer.parseInt(parsedJson.getString("idCategoria"));
		NotasDAO dao = new NotasDAO();		 
		Nota nota = new Nota();
		nota.setConteudo(parsedJson.getString("conteudoNota"));
		nota.setIdCategoria(idCategoria);
		dao.adicionaNota(nota, idCategoria);
		dao.close();
		return "home";
	}
	@RequestMapping(value = "/nota", method = RequestMethod.DELETE)
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
	@RequestMapping(value = "/nota", method = RequestMethod.PUT)
	@ResponseBody
	 public String editaNota(@RequestBody String rawJson,HttpServletRequest request, HttpServletResponse response) {
		System.out.println("EDITO");
		JSONObject parsedJson = new JSONObject(rawJson);
		Integer idCateg = Integer.parseInt(parsedJson.getString("idCategoria"));
		Integer idNota = Integer.parseInt(parsedJson.getString("idNota"));
		NotasDAO dao = new NotasDAO();
		Nota nota = new Nota();
		nota.setIdNota(idNota);
		nota.setIdCategoria(idCateg);
		nota.setConteudo(parsedJson.getString("conteudoNota"));
		dao.alteraNota(nota);
		dao.close();
		request.setAttribute("idCategoria", idCateg);		
		return "home";
	}
	@RequestMapping(value="/procura", method = RequestMethod.GET)
	@ResponseBody
	 public String procura(@RequestBody String rawJson){
		return "procura";
	}
	
	public Integer apiTempo() throws IOException {
		URL url = new URL("http://api.openweathermap.org/data/2.5/weather?id=3448439&APPID=bcba6ed7db41f9f8f0fec131c856009e");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.connect();
		int responsecode = conn.getResponseCode(); 
		String inline = "";
		if(responsecode != 200) {
			throw new RuntimeException("HttpResponseCode: "+responsecode);}
			else{
				Scanner sc = new Scanner(url.openStream());
				while(sc.hasNext())	{
				inline+=sc.nextLine();
				}
			sc.close();
			
			JSONObject parsedJson = new JSONObject(inline);
			JSONObject main = (JSONObject) parsedJson.get("main");
			Integer temperatura = main.getInt("temp") - 273;
			System.out.println(temperatura);
			return temperatura;
			}
	}
	
	public static void main(String[] args) {
		String consumerKey = "D3DhvhkWp2WsmcVtdBcxQTonw";
	    String consumerSecret = "J3piyE7WhVLyl7ly6EedIcSq6BNKBzJRfqufEyDZ9VxvnQg8tr";
	    String accessToken = "2490417132-lRk3LxifsQQLA2Rrl4gatxAoMLZDbbBKTLFzOwT";
	    String accessSecret = "1KouJV2MAZgvetqaQ7hpCWUbBcLnYCftfPrNVMPgwgunq";

	    ConfigurationBuilder cb = new ConfigurationBuilder();
	    cb.setDebugEnabled(true)
	      .setOAuthConsumerKey(consumerKey)
	      .setOAuthConsumerSecret(consumerSecret)
	      .setOAuthAccessToken(accessToken)
	      .setOAuthAccessTokenSecret(accessSecret);
	    TwitterFactory tf = new TwitterFactory(cb.build());
	    Twitter twitter = tf.getInstance();   
		try {
			Status status = twitter.updateStatus("lala land é ruim");
			System.out.println("Successfully updated the status to [" + status.getText() + "].");
		} catch (TwitterException e1) {
			e1.printStackTrace();
		}
	}
}
