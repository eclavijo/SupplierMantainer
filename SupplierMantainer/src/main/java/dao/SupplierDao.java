package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import utils.SystemHelper;
import model.SupplierPOJO;

@Component
@Repository
public class SupplierDao extends SqlSessionDaoSupport implements InterfaceSupplierDao{

	private SystemHelper sysHelper;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	
	/* (non-Javadoc)
	 * @see dao.InterfaceSupplierDao#add(model.SupplierPOJO)
	 */
	@Override
	public SupplierPOJO insert(SupplierPOJO supplier) {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("insert", supplier);
			session.commit();
			return supplier;
		} catch (Exception e) {
			System.out.println("Error in insert !!!");
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	/* (non-Javadoc)
	 * @see dao.InterfaceSupplierDao#getList()
	 */
	@Override
	public List<SupplierPOJO> getList() {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			List<SupplierPOJO> list = session.selectList("getAll");
			return list;
		} catch (Exception e) {
			sysHelper.println("Error in Listing !!!");
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	/* (non-Javadoc)
	 * @see dao.InterfaceSupplierDao#getById(long)
	 */
	@Override
	public SupplierPOJO getById(long id) {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			SupplierPOJO contact = (SupplierPOJO) session.selectOne(
					"getById", id);
			return contact;
		} catch (Exception e) {
			sysHelper.println("Error in findById !!!");
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	/* (non-Javadoc)
	 * @see dao.InterfaceSupplierDao#update(model.SupplierPOJO)
	 */
	@Override
	public SupplierPOJO update(SupplierPOJO supplier) {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.update("update", supplier);
			session.commit();
			return supplier;
		} catch (Exception e) {
			sysHelper.println("Error on update !!!");
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	/* (non-Javadoc)
	 * @see dao.InterfaceSupplierDao#deleteById(long)
	 */
	@Override
	public boolean deleteById(long id) {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.delete("deleteById", id);
			session.commit();
			return true;
		} catch (Exception e) {
			sysHelper.println("Error on delete !!!");
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	// public long getNextId() {
	//
	// SqlSession session = sqlSessionFactory.openSession();
	// long nextId = 0;
	// try {
	// nextId = (Long) session.selectOne("Supplier.getNextId");
	// session.commit();
	// } finally {
	// session.close();
	// }
	// return nextId;
	// }

}
