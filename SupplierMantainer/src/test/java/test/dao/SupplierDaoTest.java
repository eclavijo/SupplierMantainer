package dao;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.runners.MockitoJUnitRunner;

import dao.InterfaceSupplierDao;
import dao.SupplierDao;
import model.SupplierPOJO;

@RunWith(MockitoJUnitRunner.class)
public class SupplierDaoTest {

	private SupplierPOJO supplierMock;
	private InterfaceSupplierDao dao;
	private SqlSessionFactory sqlSessionFactoryMock;
	private SqlSession sessionMock;

	@Before
	public void setUp() throws Exception {
		supplierMock = mock(SupplierPOJO.class);
		sqlSessionFactoryMock = mock(SqlSessionFactory.class);
		sessionMock = mock(SqlSession.class);
		
		
		
		dao = new SupplierDao();

		when(sqlSessionFactoryMock.openSession()).thenReturn(sessionMock);
	}

//	@Test
//	public void testAddSupplier() {
//
//		SupplierPOJO supplier = new SupplierPOJO(1L, "nombre", "address",
//				"email", "1234456789");
//		SupplierPOJO expectedSupplier = supplier;
//
//		when(sessionMock.insert("insert", supplier)).thenReturn(expectedSupplier);
//		assertEquals(expectedSupplier, dao.add(supplier));
//		
//
//	}

}
