package model;

import java.util.List;


import model.SupplierPOJO;

	public interface SupplierMapper {

	    public SupplierPOJO insertSupplier(SupplierPOJO Supplier);	
	    public void update(SupplierPOJO Supplier);
	    public boolean deleteById(Long id);
	    public SupplierPOJO getById(Long id);
	    public List<SupplierPOJO> getAll();
	}

