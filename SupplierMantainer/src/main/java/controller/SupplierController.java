package controller;

import java.util.ArrayList;
import java.util.List;

import model.SupplierMapper;
import model.SupplierPOJO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import utils.SystemHelper;

import com.google.common.base.Supplier;

import dao.InterfaceSupplierDao;

@Controller
public class SupplierController {

	@Autowired
	private InterfaceSupplierDao supplierDao;

	@Autowired
	private SupplierMapper supplierService;

	SystemHelper sysHelper;

	@RequestMapping(value = "/admin")
	public ModelAndView showList(ModelMap model) {

		List<SupplierPOJO> suppliers;
		String message = "<br><div class='info' align='center'> <h3>********** Showing List of Suppliers ********** </h3>This message is comming from SupplierController /admin <br><br></div>";

		try {
			suppliers = supplierDao.getList();

			ModelAndView modelAndView = new ModelAndView("supplierAdmin",
					"message", message);

			modelAndView.addObject("suppliers", suppliers);

			return modelAndView;
		} catch (Exception e) {
			message = e.toString();

			return new ModelAndView("supplierAdmin", "message", message);
		}

	}

	@RequestMapping(value = "/listAll")
	@ResponseBody
	public List<SupplierPOJO> showListRest(ModelMap model) {

		List<SupplierPOJO> suppliers;

		try {
			suppliers = supplierDao.getList();

			return suppliers;

		} catch (Exception e) {
			return null;
		}

	}

	// @RequestMapping(value = "/done")
	// public ModelAndView welcome(ModelMap model) {
	//
	// SupplierPOJO supplier = supplierDao.getById(22L);
	// String message = "<br><div align='center'> <h3>********** Hello "
	// + supplier.getName()
	// +
	// ", Spring MVC Tutorial **********</h3>This message is comming from SupplierController <br><br></div>";
	// ModelAndView modelAndView = new ModelAndView("done", "message", message);
	//
	// modelAndView.addObject("supplier", supplier);
	// return modelAndView;
	// }

	@RequestMapping(value = { "/hello", "" }, method = RequestMethod.GET)
	public String printHello(ModelMap model) {
		model.addAttribute("message", "Hello Spring MVC Framework!");
		return "hello";
	}

	@RequestMapping(value = { "/addSupplier" }, method = RequestMethod.POST)
	public ModelAndView addSupplier(
			@ModelAttribute(value = "supplierPOJO") SupplierPOJO supplier) {
		String message = "";
		ModelAndView modelAndView = new ModelAndView("done", "message", message);
		try {
			supplierDao.insert(supplier);
			message = "<br><div class='success' align='center'> <h3>********** Adding a new Supplier ********** </h3>Down Here is the new Supplier Added. <br> This message is comming from SupplierController /addSupplier <br><br></div>";
		} catch (Exception e) {

			message = "<br><div class='error' align='center'> <h3>********** Couldn´t add a new Supplier ********** </h3> <br> "
					+ e.toString()
					+ "<br> This message is comming from SupplierController /addSupplier <br><br></div>";
		}
		modelAndView = new ModelAndView("done", "message", message);
		modelAndView.addObject("supplier", supplier);

		return modelAndView;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("id") long id) {

		String message = "";
		SupplierPOJO supplier = new SupplierPOJO();
		ModelAndView modelAndView = new ModelAndView("done", "message", message);
		try {
			supplier = supplierDao.getById(id);
			supplierDao.deleteById(id);
			message = "<br><div class='success' align='center'> <h3>********** Supplier Deleted ********** </h3> <br> <br> This message is comming from SupplierController /addSupplier <br><br></div>";

		} catch (Exception e) {

			message = "<br><div class='error' align='center'> <h3>********** Couldn´t delete the Supplier ********** </h3> <br> "
					+ e.toString()
					+ "<br> This message is comming from SupplierController /delete <br><br></div>";

		}
		modelAndView = new ModelAndView("done", "message", message);
		modelAndView.addObject("deleted", supplier);
		return modelAndView;
	}

	@RequestMapping(value = "/modify")
	public ModelAndView modify(@RequestParam("id") long id) {

		SupplierPOJO supplier = supplierDao.getById(id);
		String message = "<br><div class='info' align='center'> <h3>********** Modify a Supplier ID:"
				+ id
				+ "**********</h3>This message is comming from SupplierController  /modify  <br><br></div>";
		ModelAndView modelAndView = new ModelAndView("updateSupplier",
				"message", message);

		modelAndView.addObject("modify", supplier);
		return modelAndView;
	}

	@RequestMapping(value = "/update")
	public ModelAndView update(
			@ModelAttribute(value = "supplierPOJO") SupplierPOJO supplier) {

		String message = "";
		ModelAndView modelAndView;
		try {
			supplierDao.update(supplier);
			message = "<br><div class='success' align='center'> <h3>********** Supplier Updated ********** </h3> <br> <br> This message is comming from SupplierController /addSupplier <br>Showing the  Supplier<br></div>";
		} catch (Exception e) {

			message = "<br><div class='error' align='center'> <h3>********** Couldn´t update the Supplier ********** </h3> <br> "
					+ e.toString()
					+ "<br> This message is comming from SupplierController /delete <br><br></div>";
		}

		modelAndView = new ModelAndView("done", "message", message);
		modelAndView.addObject("supplier", supplier);

		return modelAndView;
	}

}
