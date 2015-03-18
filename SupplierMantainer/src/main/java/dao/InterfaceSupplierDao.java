package dao;

import java.util.List;

import model.SupplierPOJO;

public interface InterfaceSupplierDao {

	public abstract SupplierPOJO insert(SupplierPOJO supplier);

	public abstract List<SupplierPOJO> getList();

	public abstract SupplierPOJO getById(long id);

	public abstract SupplierPOJO update(SupplierPOJO supplier);

	public abstract boolean deleteById(long id);

}