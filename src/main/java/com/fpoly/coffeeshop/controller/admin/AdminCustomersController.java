package com.fpoly.coffeeshop.controller.admin;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpoly.coffeeshop.model.Customers;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IUserService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/customers")
public class AdminCustomersController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ICustomersService customersService;
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}

	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = false;

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", customersService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("customers", customersService.findAllByFlagDelete(flagDelete, page, limit));
		
		return "admin/customers/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("users", userService.findAll());
		model.addAttribute("check", false);
		model.addAttribute("customers", new Customers());
		
		return "admin/customers/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		model.addAttribute("users", userService.findAll());
		model.addAttribute("check",true);
		model.addAttribute("customers",customersService.findOne(id));
		
		return "admin/customers/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute Customers customers) {
		String url = getDomain()+"/customers";
		String message = "";
		String alert = "danger";
		
		RestTemplate restTemplate = new RestTemplate();
		
		customers.setFlagDelete(false);
		
		if (customers.getId() == null) {
			url += "/insert";
			
			Boolean result = restTemplate.postForObject(url, customers, Boolean.class);
			
			if (result) {
				message = "insert success";
				alert = "success";
			} else {
				message = "insert fail";
			}
		} else {
			url += "/update?id=" + customers.getId();
			
			try {
				restTemplate.put(url, customers);
				
				message = "update success";
				alert = "success";
			} catch (Exception e) {
				message = "update fail";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/customers/list?page=1";
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("id") Long id) {
		String url =getDomain()+ "/customers/id/" + id;
		String message = "";
		String alert = "danger";
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Customers> reusult = restTemplate.getForEntity(url, Customers.class);
		Customers customers = reusult.getBody();
		
		String deleteURL = getDomain()+"/customers/update?id=" + customers.getId();
		
		try {
			customers.setFlagDelete(true);
			restTemplate.put(deleteURL, customers);
			
			message = "delete success";
			alert = "success";
		} catch (Exception e) {
			message = "delete fail";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/customers/list?page=1";
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");
		String page = "1";
		
		model.addAttribute("key", key);
		model.addAttribute("page", page);
		
		return "redirect:/admin/customers/search";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearchPage(HttpServletRequest request) {
		String key = request.getParameter("key");
		String page = request.getParameter("page");
		String flagDelete = "false";
		String limit = "10";
		
		String customerURL = getDomain()+"/customers/flag_delete/search/list?key=" + key + "&flag_delete=" + flagDelete + "&page=" + page + "&limit=" + limit;
		String totalPagesURL = getDomain()+ "/customers/flag_delete/search/total_pages?key=" + key + "&flag_delete=" + flagDelete + "&page=" + page + "&limit=" + limit;

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		ResponseEntity<String> result = restTemplate.exchange(customerURL, HttpMethod.GET, entity, String.class);
		System.out.println(result);
		request.setAttribute("key", key);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", restTemplate.getForObject(totalPagesURL, String.class));
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			List<Customers> customers = mapper.readValue(result.getBody(), new TypeReference<List<Customers>>(){});
			request.setAttribute("customers", customers);
		} catch (Exception e) {
		}
		
		return "admin/customers/search";
	}
}
